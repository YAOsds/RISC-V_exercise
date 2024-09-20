# Calling Convention
# Demo to create a leaf routine
#
# unsigned int square(unsigned int i) 
# { 
#   return i * i; 
# } 
# unsigned int sum_squares(unsigned int i) 
# { 
#   unsigned int sum = 0; 
#   for (int j = 1; j <= i; j++) { 
#     sum += square(j); 
#   } 
#   return sum; 
# } 
# void _start() 
# { 
#   sum_squares(3); 
# } 

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	la sp, stack_end	# prepare stack for calling functions

	li a0, 3
	call sum_squares	# call sum_squares function with argument 3
	mv x1, a0		# store the result in x1 register

	# the time return here, a0 should stores the result
stop:
	j stop			# Infinite loop to stop execution

# int square(int num)
square:
	# 作用是计算num的平方，并返回结果
	# 保存调用者的上下文，包括返回地址和参数
	addi sp, sp, -8 # 将栈指针向下移动8个字节，准备保存调用者的上下文
	sw s0, 0(sp) 	# 保存寄存器s0
	sw s1, 4(sp) 	# 保存寄存器s1

	# 实现平方计算
	mv s0, a0 		# 将参数num的值存入寄存器s0
	mul s1, s0, s0  # 计算num的平方，结果存入寄存器s1
	mv a0, s1 		# 将结果返回给调用者

	# 恢复调用者的上下文
	lw s0, 0(sp)
	lw s1, 4(sp)
	addi sp, sp, 8

	ret

	# add nop here just for demo in gdb
	nop

sum_squares:
	# 作用是计算1到num的平方和
	# 保存调用者的上下文，包括返回地址和参数
	addi sp, sp, -16 # 将栈指针向下移动8个字节，准备保存调用者的上下文
	sw s0, 0(sp) 	# 保存寄存器s0
	sw s1, 4(sp) 	# 保存寄存器s1
	sw s2, 8(sp) 	# 保存寄存器s2
	sw ra, 12(sp)   # 保存返回地址

	# 实现计算平方和
	mv s0, a0 		# 将参数num的值存入寄存器s0
	li s1, 0 		# 初始化变量sum为0
	beq s0, s1, end_sum_squares 	# 如果num为0，则直接返回sum=0

	# 循环计算1到num的平方和
	sum_loop:
		addi s2, s2, 1 	# j++
		mv x3, s2
		mv a0, s2 		# 将j的值传递给square函数
		call square 		# 调用square函数计算j的平方
		add s1, s1, a0 	# 计算sum=sum+square(j)
		bne s2, s0, sum_loop 	# 循环直到j=num

	# 计算结束，将结果返回给调用者
	mv a0, s1 		# 将结果返回给调用者

	# 恢复调用者的上下文
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	lw ra, 12(sp)
	addi sp, sp, 16

	ret
	# add nop here just for demo in gdb
	nop

end_sum_squares:
	# 循环结束，sum=0，直接返回
	mv a0, s1
	ret

	# allocate stack space
stack_start:
	.rept 12
	.word 0
	.endr
stack_end:

	.end			# End of file
