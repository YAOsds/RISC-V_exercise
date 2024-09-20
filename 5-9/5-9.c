// 嵌入一段汇编代码，实现c = a * a + b * b; 
int foo(int a, int b) { 
    int c; 
    asm volatile ( 
        "mul %[a], %[a], %[a] \n\t" 
        "mul %[b], %[b], %[b] \n\t" 
        "add %[c], %[a], %[b] \n\t" 
        : [c] "=r" (c) 
        : [a] "r" (a), [b] "r" (b) 
    ); 
    return c; 
}