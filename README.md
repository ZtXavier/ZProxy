## 项目介绍
ZProxy是一个反向代理，用户可在自己内网环境中启动一个业务服务，并在同一网络下启动ProxyClient，用于向ProxyServer注册服务。ProxyClient和ProxyServer之间会创建一个隧道，外网可以通过访问ProxyServer，数据转发到ProxyClient，从而被业务服务接收到。实现内网服务被外网访问。

## 使用
- build
```
bash build.sh
- 启动服务端
```
cd build/server
./server --zproxy_port=8090 --work_thread_nums=4
```
- 启动客户端
```
cd build/client
./client --local_server=127.0.0.1:9999 --zproxy_server=127.0.0.1:8080
```
## 技术特点

- 使用epoll作为IO多路复用的实现
- 采用Reactor多线程模型，充分利用多核CPU性能
- 数据转发时，使用splice零拷贝，减少IO性能瓶颈
- 数据连接和控制连接解耦，避免互相影响


## 核心架构
### 角色
- LocalServer: 内网业务服务
- ProxyClient: Proxy客户端,与LocalServer部署在一起,对接ProxyServer和InnerServer
- ProxyServer: Proxy服务端
- PublicClient: 业务客户端

### 数据流
PublicClient先将请求打到ProxyServer，ProxyServer识别请求是属于哪个ProxyClient，然后将数据转发到ProxyClient，ProxyClient再识别请求是属于哪个LocalServer的，将请求再转发到LocalServer，完成数据的转发。



### 工作流程

ProxyServer端类:

- Control：在ProxyServer中会维护一个ControlMap，一个Control对应一个ProxyClient，存储ProxyClient的一些元信息和控制信息
- Tunnel：每个Control中会维护一个TunnelMap，一个Tunnel对应一个LocalServer服务

在ProxyClient端，也会维护一个TunnelMap，每个Tunnel对应一个LocalServer服务，只不过Client端的Tunnel与Server端的Tunnel存储的内容略有差异

#### 启动流程
##### ProxyServer
1. 完成几种工作线程的初始化。
2. 监听一个CtlPort，等待ProxyClient连接。

##### ProxyClient
1. 完成对应线程的初始化。
2. 然后连接Server的CtlPort，此连接称为Ctl_conn, 用于client和server之前控制信息的传递。
3. 请求注册Control，获取ctl_id。
4. 最后再根据Tunnel配置文件完成多个Tunnel的注册。需要注意的是，每注册一个Tunnel，Server端就会多监听一个PublicPort，作为外部访问LocalServer的入口。

#### 数据转发流程
1. Web上的PublicClient请求ProxyServer上的PublicPort建立连接；ProxyServer接收连接请求，将public_accept_fd封装成PublicConn。
2. ProxyServer通过ctl_conn向client发送NotifyClientNeedProxyMsg通知Client需要创建一个proxy。
3. Client收到后，会分别连接LocalServer和ProxyServer：
    3.1. 连接LocalServer，将local_conn_fd封装成LocalConn。
    3.2. 连接ProxyServer的ProxyPort，将proxy_conn_fd封装成ProxyConn，并将LocalConn和ProxyConn绑定。
4. ProxyServer的ProxyPort收到请求后，将proxy_accept_fd封装成ProxyConn，将ProxyConn与PublicConn绑定。
5. 此后的数据在PublicConn、ProxyConn和LocalConn上完成转发传输。


## 连接管理
### 复用Proxy连接
为了避免频繁创建销毁proxy连接，在完成数据转发后，会将ProxyConn放到空闲队列中，等待下次使用。
proxy_conn有两种模式 - 数据传输模式和空闲模式。在数据传输模式中，proxy_conn不会去读取解析缓冲区中的数据，只会把数据通过pipe管道转发到local_conn; 空闲模式时，会读取并解析缓冲区中的数据，此时的数据是一些控制信息，用于调整proxy_conn本身。

当有新publicClient连接时，会先从空闲列表中获取可用的Proxy_conn，此时Proxy_conn处于空闲模式，ProxyServer端会通过proxy_conn向ProxyClient端发送StartProxyConnReqMsg，
CLient端收到后，会为这个Proxy_conn绑定一个local_conn, 并将工作模式置为数据传输模式。之后数据在这对Proxy_conn上进行转发。

## 数据传输

在ZProxy中，使用splice的零拷贝方案，数据直接从内核空间的Source Socket Buffer转移到Dest Socket Buffer，不需要任何CPU copy。

splice通过pipe管道“传递”数据，基本原理是通过pipe管道修改source socket buffer和dest socket buffer的物理内存页

splice并不涉及数据的实际复制，只是修改了socket buffer的物理内存页指针。

## 并发模型
ProxyClient和ProxyServer均采用多线程reactor模型，利用线程池提高并发度。并使用epoll作为IO多路复用的实现方式。每个线程都有一个事件循环（One loop per thread）。线程分多类，各自处理不同的连接读写。

### ProxyServer端
为了避免业务连接处理影响到Client和Server之间控制信息的传递。我们将业务数据处理与控制数据处理解耦。在Server端中设置了三种线程：
- mainThread: 用于监听Ctl_conn和Proxy_conn的连接请求以及Ctl_conn上的相关读写
- publicListenThread: 监听并接收外来连接
- eventLoopThreadPool: 线程池，用于处理Public_conn和Proxy_conn之间的数据交换。

### ProxyClient端
client端比较简单，只有两种线程：
- mainThread: 用于处理Ctl_conn的读写
- EventLoopThreadPool: 线程池，用于处理Proxy_conn和local_conn之间的数据交换


