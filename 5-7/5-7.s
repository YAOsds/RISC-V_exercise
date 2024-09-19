# 编写汇编指令，使⽤条件分⽀指令循环遍历⼀个字符串数组， 获取该字符串的⻓度

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x2, '\0' 		# 将字符'\0'赋值给x2
	li x5, 0        	# 初始化计数器x5为0
	la x1, _char     	# 加载字符串地址到x1
count:	
	lb x6, 0(x1)     	# 加载字符串的第一个字符到x6
	beq x6, x2, stop 	# 如果第一个字符等于'\0'，则停止循环
	addi x5, x5, 1   	# 计数器加1
	addi x1, x1, 1   	# 字符串指针加1
	bne x2, x6, count   # 循环条件，当前字符不等于'\0'，则继续循环
	

stop:
	j stop			# Infinite loop to stop execution

_char:
	.byte 'h', 'e', 'l', 'l', 'o', ',', 'w', 'o', 'r', 'l', 'd', '!', '\0'

	.end			# End of file



