display/z $x1
display/z $x2
display/z $x3
display/z $x4
display/z $x5
display/z $x6
display/z $x7

set disassemble-next-line on
b _start
target remote : 1234
c
