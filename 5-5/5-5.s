# 练习 5-5,实现如下c代码:
# int array[2] = {0x11111111, 0xffffffff}; 
# int i = array[0]; 
# int j = array[1];


	
	.text # 定义代码段
	.global _start # 定义程序入口
_start:
	la x3, _array # 加载数组的首地址
	lw x1, 0(x3) # 从数组中取出第一个元素
	lw x2, 4(x3) # 从数组中取出第二个元素，偏移量为4字节
	
stop:
	j stop	
	
_array:	  # 数组的定义
	.word 0x11111111 # 第一个元素，word为4字节
	.word 0xffffffff # 第二个元素


	.end

	
	
