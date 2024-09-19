# 练习 5-2
	.text
	.global _start

_start:
	li x2, 0x1
	li x3, 0x2
	li x5, 0x3
	add x1, x2, x3
	sub x4, x1, x5

stop:
	j stop
	
	.end
