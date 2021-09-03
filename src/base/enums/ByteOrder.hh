#ifndef __ENUM__None__ByteOrder__
#define __ENUM__None__ByteOrder__

enum class ByteOrder {
    big = 0,
    little = 1,
    Num_ByteOrder = 2
};
extern const char *ByteOrderStrings[static_cast<int>(ByteOrder::Num_ByteOrder)];

#endif // __ENUM__None__ByteOrder__
