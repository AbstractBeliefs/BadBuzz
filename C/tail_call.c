#include <stdio.h>
#include <stdlib.h>

typedef int (fn)(int);
typedef int (*fnp)(int);

#define MAX 128

fn a, b, c, d, e;
#define FIZZBUZZ(x) (((x) != 0) * (((x) % 3 == 0) | (((x) % 5 == 0) << 1)))
#define ABCDE(x) ((fnp[]){ a, b, c, d, e }[(x) < MAX ? FIZZBUZZ(x) : 4](x))

int a(int i) { printf("%d\n", i); return ABCDE(i + 1); }
int b(int i) { fputs("fizz\n", stdout); return ABCDE(i + 1); }
int c(int i) { fputs("buzz\n", stdout); return ABCDE(i + 1); }
int d(int i) { fputs("fizzbuzz\n", stdout); return ABCDE(i + 1); }
int e(int i) { exit(0); return 0; (void)i; }

int main(void) {
	ABCDE(0);
	return EXIT_SUCCESS;
}
