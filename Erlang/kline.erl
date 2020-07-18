-module(fizzbuzz).
-export([
    fizzbuzz/1,
    fizzbuzzprinter/1
]).

fizzbuzz(Max) -> fizzbuzz(1, Max).
fizzbuzz(Current, Max) when Current == Max -> spawn(tut, fizzbuzzprinter, [Current]), ok;
fizzbuzz(Current, Max) -> spawn(tut, fizzbuzzprinter, [Current]), fizzbuzz(Current+1, Max).

fizzbuzzprinter(Delay) when Delay rem 5 == 0, Delay rem 3 == 0 -> timer:sleep(Delay * 1000), io:format("FizzBuzz~n");
fizzbuzzprinter(Delay) when Delay rem 5 == 0 -> timer:sleep(Delay * 1000), io:format("Fizz~n");
fizzbuzzprinter(Delay) when Delay rem 3 == 0 -> timer:sleep(Delay * 1000), io:format("Buzz~n");
fizzbuzzprinter(Delay) -> timer:sleep(Delay * 1000), io:format("~p~n", [Delay]).
