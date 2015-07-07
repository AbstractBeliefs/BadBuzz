"""Fizz-buzz for my github account 2 get job"""
"""I was told lambdas are cool"""
listOfNumbersToBeFizzBuzzed = [x for x in range(1, 16)]

#special thanks to Greg for telling be about the == operator
fizzbuzz = lambda x: "fizzbuzz" if x % 3 == 0 and x % 5 == 0 else x
fizz = lambda x: "fizz" if isinstance(x, int) and  x % 3 == 0 else x
buzz = lambda x: "buzz" if isinstance(x, int)  and x % 5 == 0 else x

listOfFizzBuzzsAndNumbers = list(map(fizzbuzz, listOfNumbersToBeFizzBuzzed))
listOfFizzBuzzsAndNumbers = list(map(fizz, listOfFizzBuzzsAndNumbers))
listOfFizzBuzzsAndNumbers = list(map(buzz, listOfFizzBuzzsAndNumbers))
print(listOfFizzBuzzsAndNumbers)
