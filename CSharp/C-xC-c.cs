using System;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;

await foreach (var _ in await await await await await await await 0_0) ;

static class Ext
{
    public static FizzBuzzEnumerator GetAsyncEnumerator(this int i) => new(i);

    public static FizzBuzzAwaiter GetAwaiter(this int depth) => new(depth);

    public static void FizzBuzz(int i) => Console.WriteLine((i % 15) switch
    {
        0 => "FizzBuzz",
        5 or 10 => "Buzz",
        3 or 6 or 9 or 12 => "Fizz",
        _ => i.ToString()
    });
}

record FizzBuzzAwaiter(int Depth) : INotifyCompletion
{
    public bool IsCompleted => true;

    public int GetResult()
    {
        Ext.FizzBuzz(Depth);

        return Depth + 1;
    }

    public void OnCompleted(Action continuation)
    {
    }
}

sealed class FizzBuzzEnumerator
{
    public int Current { get; private set; }

    public FizzBuzzEnumerator(int current) => Current = current;

    public ValueTask<bool> MoveNextAsync()
    {
        Ext.FizzBuzz(Current);

        return new(Current++ < 100);
    }
}
