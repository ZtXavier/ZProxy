#include <string.h>
#include <unistd.h>
#include <exception>
#include <iostream>
#include <stdexcept>

#include "Buffer.h"
#include "spdlog/spdlog.h"

const int DOUBLE_BORDER_LINE = 1024;

// 插入数据,支持可变容量
void Buffer::EnsureInsert(int insert_len) {
  if (getFreeSize() >= insert_len) {
    return;
  }
  // 需要扩容
  // 参考golang切片扩容机制
  int min_cap_need = capacity_ + insert_len;
  if (min_cap_need > max_capacity_) {
    // 超过最大允许容量直接抛出错误
    throw std::runtime_error("out of capacity");
  }
  int newcap = capacity_;
  int doublecap = capacity_ * 2;
  // 如果所需要的最小的容量大于两倍的当前容量,则需要扩容
  if (min_cap_need > doublecap) {
    newcap = min_cap_need;
  } else {
    if (capacity_ < DOUBLE_BORDER_LINE) {
      // 当前容量小于1024时，取max_capacity_和doublecap中较小的一个
      newcap = doublecap <= max_capacity_ ? doublecap : max_capacity_;
    } else {
      while (newcap < min_cap_need) {
        newcap += newcap / 4;
        // 当newcap超过最大允许容量时，设置新容量=最大容量，并退出循环
        if (newcap > max_capacity_) {
          newcap = max_capacity_;
          break;
        }
      }
    }
  }
  reSize(newcap);
}

// 获得还没读完的大小
int Buffer::GetUnReadSize() {
  if (write_index_ >= read_index_) {
    return write_index_ - read_index_;
  }
  return (data_size_ - read_index_) + write_index_;
}

inline int Buffer::getFreeSize() { 
    return capacity_ - GetUnReadSize();
}

void Buffer::reSize(int capacity) {
  int unread_size = GetUnReadSize();

  if (unread_size > capacity) {
    return;
  }
  if (capacity == capacity_) {
    return;
  }

  char *tmp = (char *)malloc(capacity + 1);
  for (int i = 0; i < unread_size; i++) {
    int cur_index = (read_index_ + i) % data_size_;
    memcpy(tmp + i, data_ + cur_index, 1);
  }

  free(data_);
  data_ = tmp;
  data_size_ = capacity + 1;
  capacity_ = capacity;
  read_index_ = 0;
  write_index_ = unread_size;
}

// 读文件
size_t Buffer::Read(char *data, int expect_len) {
  if (expect_len <= 0) {
    return 0;
  }
  if (expect_len > GetUnReadSize()) {
    return -1;
  }

  int cur_index = read_index_;
  for (int i = 0; i < expect_len; i++) {
      // 这里使用环状数组来复用
    cur_index = (read_index_ + i) % data_size_;
    // 这里能够减少开销
    memcpy(data + i, data_ + cur_index, 1);
  }
  read_index_ = (cur_index + 1) % data_size_;
  return expect_len;
}

size_t Buffer::WriteToBuffer(char *data, int expect_len) try {
  if (expect_len <= 0) {
    return 0;
  }
  EnsureInsert(expect_len);

  int cur_index = write_index_;
  for (int i = 0; i < expect_len; i++) {
    cur_index = (write_index_ + i) % data_size_;
    memcpy(data_ + cur_index, data + i, 1);
  }
  write_index_ = (cur_index + 1) % data_size_;
  return expect_len;
} catch (std::exception &e) {
  SPDLOG_CRITICAL("write to buffer except: {}", e.what());
  return 0;
}


size_t Buffer::WriteToSocket(int fd) {
  int total_sent_num = 0;
  while (GetUnReadSize() > 0) {
    int cur_send_len = write_index_ - read_index_;
    if (read_index_ > write_index_) {
      cur_send_len = data_size_ - read_index_;
    }
    size_t writeNum = write(fd, data_ + read_index_, cur_send_len);
    if (writeNum == 0) {
      if (errno == EINTR) {
        continue;
      } else {
        // 缓冲区满了，或者写入报错，直接退出
        break;
      }
    }
    read_index_ = (read_index_ + writeNum) % data_size_;
    total_sent_num += writeNum;
  }
  return total_sent_num;
}