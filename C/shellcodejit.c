//linux x86 shellcode jit fizzbuzz, no stdlib needed
//gcc -fno-stack-protector -z execstack -m32 -nostdlib fizzbuzz.c -o fizzbuzz

int _start(void) {
    int j, x, i = 0;
    unsigned char f[5000];
    unsigned char *p = f;
    unsigned char *m[] = {"\x6a\xb\xfe\xc\x24\x68\x30\x30\x30\x31\x6a"
                          "\x4\x58\x6a\x1\x5b\x89\xe1\x6a\x5\x5a\xcd\x80",
                          "\x6a\xb\xfe\xc\x24\x68\x46\x69\x7a\x7a\x6a\x4"
                          "\x58\x6a\x1\x5b\x89\xe1\x6a\x5\x5a\xcd\x80", 
                          "\x6a\xb\xfe\xc\x24\x68\x42\x75\x7a\x7a\x6a\x4"
                          "\x58\x6a\x1\x5b\x89\xe1\x6a\x5\x5a\xcd\x80",
                          "\x6a\xb\xfe\xc\x24\x68\x42\x75\x7a\x7a\x68\x46"
                          "\x69\x7a\x7a\x6a\x4\x58\x6a\x1\x5b\x89\xe1\x6a"
                          "\x9\x5a\xcd\x80"};
    unsigned int v = 810092048;
    unsigned int l = 471275287;
    while(i<100) {
        j = v & 3; x = 0;
        v = v >> 2 | j << 28;
        while(x<(l>>(j*8)&0xFF)) { *(p++) = m[j][x]; x++; }
        *(p-14)+=(i%10)*(j==0);
        *(p-15)+=((i/10)%10)*(j==0);
        *(p-16)+=((i/100)%10)*(j==0);
        i++;
    }
    ((void(*)())f)();
}