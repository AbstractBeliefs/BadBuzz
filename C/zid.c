#include <stdio.h>
#include <stdlib.h>

static void printn(int n)
{
    printf("%d\n", n);
}

static void printfizz(int n)
{
    printf("fizz\n");
}

static void printbuzz(int n)
{
    printf("buzz\n");
}

static void printfizzbuzz(int n)
{
    printf("fizzbuzz\n");
}

static void nop(int n){main(n+1);}
static void die(int n){exit(0);}

static void (*arr[])(int) = {printn, printfizz, printbuzz, printfizzbuzz};
static void (*arr2[])(int) = {nop, die};

int main(int n)
{
    arr[!(n%3) + (!(n%5)<<1)](n);
    arr2[n/100](n);
}
