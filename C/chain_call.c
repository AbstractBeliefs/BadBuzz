#include <stdio.h>
#include <stdlib.h>

struct _ { struct _ (*f)(void); };

#define FIZZBUZZ(x) (((x) != 0) * (((x) % 3 == 0) | (((x) % 5 == 0) << 1)))
struct _ f(void) {
	static int i = 0;
	printf((char*[]){"%d\n", "fizz\n", "buzz\n", "fizzbuzz\n"}[FIZZBUZZ(i)], i);
	i++;
	return (struct _){ .f = f };
}

int main(void) {
	 f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f()
	.f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f()
	.f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f()
	.f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f()
	.f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f()
	.f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f()
	.f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f()
	.f().f().f().f().f().f().f().f().f().f().f().f().f().f().f().f();
	return EXIT_SUCCESS;
}
