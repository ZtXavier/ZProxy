#ifndef _BUFFER_H_
#define _BUFFER_H_

#include<iostream>
#include<memory>



class Buffer {
    public:
    Buffer(int Capacity = 8,int Max_Capacity = 1024) 
    : capacity_(Capacity),data_size_(Capacity + 1) {
        max_capacity_ = Max_Capacity > Capacity ? Max_Capacity : Capacity;
        data_ = (char *)malloc(data_size_);
    }
    ~Buffer() {
        free(data_);
    }

    size_t Read(char* data, int expect_len);
    size_t WriteToBuffer(char * data, int expect_len);
    size_t WriteToSocket(int fd);
    int GetUnReadSize();

    private:
    void EnsureInsert(int insert_len);
    void reSize(int new_size);
    inline int getFreeSize();
    int capacity_;
    int max_capacity_;
    int data_size_;
    int read_index_ = 0;
    int write_index_ = 0;
    char *data_;
};
typedef std::shared_ptr<Buffer> SP_Buffer;

#endif
