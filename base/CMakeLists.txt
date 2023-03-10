set(LIB_SRC
    Buffer.cpp
    Channel.cpp
    Ctl_conn.cpp
    Epoll.cpp
    EventLoop.cpp
    EventLoopThread.cpp
    EventLoopThreadPool.cpp
    Msg.cpp
    Proxy_conn.cpp
    Util.cpp
)

add_library(base ${LIB_SRC})
target_link_libraries(base pthread)