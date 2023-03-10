#pragma once
#include <sys/epoll.h>
#include <functional>
#include <iostream>
#include <mutex>
#include <unordered_map>

#include "Control.h"
#include "Tunnel.h"
#include "../base/Ctl_conn.h"
#include "../base/EventLoop.h"
#include "../base/EventLoopThread.h"
#include "../base/EventLoopThreadPool.h"
#include "../base/Proxy_conn.h"

const int UnclaimedProxyMapLen = 4;
struct UnclaimedProxyMap {
  std::unordered_map<int, SP_ProxyConn> conns;
  std::mutex mutex;
};

class Server : public std::enable_shared_from_this<Server> {
 public:
  Server(int threadNum, int ctlPort, int proxyPort);
  void start();
  // 使用一个map来维护自己管理的proxyClient
  std::unordered_map<std::string, SP_Control> control_map_;
  // 用于监听proxyClient的连接请求
  SP_EventLoopThreadPool eventLoopThreadPool_;
  // 用于监听public文件描述符,就是来连接publicClient
  SP_EventLoopThread publicListenThread_;
  int getProxyPort() { return proxyPort_; };
  UnclaimedProxyMap* getUnclaimedProxyMapByFd(int fd);

 private:
  int ctlPort_;
  int proxyPort_;
  int ctlListenFd_;
  int proxyListenFd_;
  SP_EventLoop loop_;
  SP_Channel ctl_acceptor_;
  SP_Channel proxy_acceptor_;
  UnclaimedProxyMap* hashedUnclaimedProxyMaps[UnclaimedProxyMapLen];
  void newCtlConnHandler();
  void newProxyConnHandler();
  void postHandler();
  void claimProxyConn(void*, SP_ProxyConn);
};