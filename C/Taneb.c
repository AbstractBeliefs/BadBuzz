#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define D0 default: return 0;
#define Ez(t) else if (t(f))

void s(unsigned char*z) 
{
  int j = 0;
  if (z[0])
    while (!(isdigit(++z[0])))
      if (!j)
	s(z+ ++j);
}

int iz(unsigned char*z) {
  switch (z[0]) {
  case '0': case '3': case '6': case '9': switch (z[1]) {
    case '0': case '3': case '6': case '9': switch (z[2]) {
      case '0': return 1;
      D0
      }
    D0
    };
  case '1': case '4': case '7': switch (z[1]) {
    case '2': case '5': case '8': return 1;
    D0
    };
  case '2': case '5': case '8': switch (z[1]) {
    case '1': case '4': case '7': return 1;
    D0
    };
  D0
  }
}

int uz(unsigned char*z) {
  switch(z[0]) {
  case '0': case '5': return 1;
  D0
  }
}

int main() {
  unsigned char f[4] = {48,48,48,0};
  int i;
 l:
  s(f);
  if (iz(f)&&uz(f))
    puts("Fizzbuzz");
  Ez(iz)
    puts("Fizz");
  Ez(uz)
    puts("Buzz");
  else {
    for(i = 0; i < 3; i++)
      putchar(f[2-i]);
      putchar('\n');
    }
  if(f[2] != '1')
    goto l;
  return 0;
}
