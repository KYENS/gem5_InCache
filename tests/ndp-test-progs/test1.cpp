// Author :Yen-Shi Kuo   Email: thomaskaku@gmail.com
// 2021 Aug 25  test program using m5_sum pseudo instruction
//  in cache computing will be tested in next test-program

#include <iostream>
#include "../../include/gem5/m5ops.h"
#include <algorithm>
#define TEST_NUM 255
size_t *array;
void print_array10(){
	for (int i=0;i<10;i++)
		std::cout<<array[i]<<',';
	std::cout<<std::endl;
	for (int i=TEST_NUM-11;i<TEST_NUM;i++)
		std::cout<<array[i]<<',';
	std::cout<<std::endl;
}
int main(){
	array=(size_t*) calloc (TEST_NUM,sizeof(size_t) );
	for(int i=0;i<TEST_NUM;i++)
		array[i]=TEST_NUM-i;
	uintptr_t array_ptr = (size_t) ( (size_t*) array );

	std::cout << "array addr: " << array << std::endl;
	std::cout << "array pointer : " << array_ptr << std::endl;
	//prints first 10 & last 10 elements in the array
	print_array10();
	//access the data from in cache
	m5_dump_stats(0,0);
	//sort the array
	std::sort(array, array+TEST_NUM);
	m5_reset_stats(0,0);
	m5_sum((uint64_t) array_ptr,sizeof(size_t)*TEST_NUM,2,3,4,109900);
	//prints first 10 & last 10 elements in the array
	print_array10();


}
