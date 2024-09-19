#练习 5-4

	.text
	.global _start
_start:
	li x1, 0x87654321
	srli x2, x1, 0x10 #x2=0x00008765 0x10=16=4wei
	slli x3, x2, 0x10 #x3=0x87650000
	sub x4, x1, x3 #x4=0x00001234

stop:
	j stop
	.end
	
	
