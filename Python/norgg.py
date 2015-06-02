from __future__ import division

from itertools import cycle
fizzbuzz = (1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz")
for idx, i in enumerate(cycle(fizzbuzz)):
    if isinstance(i, int):
        i += (idx//15*15)
    print i
