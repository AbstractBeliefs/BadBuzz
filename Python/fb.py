#! /usr/bin/env python2

for x in range(100):
    if x%3 == 0 and x%5 == 0:
        print "FizzBuzz"
    elif x%3 == 0:
        print "Fizz"
    elif x%5 == 0:
        print "Buzz"
    else:
        print x
