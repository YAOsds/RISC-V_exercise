# 在内存中定义⼀个结构体变量，编写汇编程序，
# ⽤宏⽅式（.macro/.endm）实现对结构体变量的成员赋值以及读取该结构体变量的成员的值到寄存器变量中
# 结构体变量定义如下：
# struct {
#      unsigned int a; 
#      unsigned int b;
# } myStruct;

	.text # 定义代码段
	.global _start # 定义程序入口
_start:
	
	# 定义宏
    # 作用为将寄存器变量的值写入结构体变量的成员变量中
	.macro SET_STRUCT reg_addr reg_a, reg_b
		sw \reg_a, 0(\reg_addr)
		sw \reg_b, 4(\reg_addr)
	.endm
    # 作用为将结构体变量的成员变量的值读取到寄存器变量中
    	.macro GET_STRUCT reg_addr reg_a, reg_b
		lw \reg_a, 0(\reg_addr)
		lw \reg_b, 4(\reg_addr)
	.endm
	

    la x3, _struct # 定义寄存器变量x3，并将其值设置为结构体变量的地址
	li x1, 0x12345678 # 定义寄存器变量t0
	li x2, 0x87654321 # 定义寄存器变量t1
	

	# 调用宏函数，对结构体变量的成员赋值
	SET_STRUCT x3, x1, x2,  

    # 调用宏函数，读取结构体变量的成员的值到寄存器变量中
    GET_STRUCT x3, x4, x5, 
    	
    	
	
stop:
	j stop	
	
_struct:	  
	.word 0x11111111 # 定义结构体变量的成员变量a
	.word 0xffffffff # 定义结构体变量的成员变量b

	.end