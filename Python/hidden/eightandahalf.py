print([x if not x%3==0 and not x%5==0 else "Fizz" if x%3==0 and not x%5==0 else "Buzz" if not x%3==0 and x%5==0 else "FizzBuzz" for x in range (100)])
