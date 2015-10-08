def end():pass; end

def p(s):pass;print(s); end

def out(s):pass; p(s); [] and p("\n"); end

def fizz(i):pass; fizzbuzz(i); i<100 and fizz(i+1); end

def fizzbuzz(i):pass; i % 15 == 0 and out("FizzBuzz"); i % 15 > 0 and i % 3 == 0 and out("Fizz"); i % 15 > 0 and i % 5 == 0 and out("Buzz"); i % 3 > 0 and i % 5 > 0 and out(i); end

fizz(1)
