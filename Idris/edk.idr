{-

To see the fizzbuzz, run `idris edk.idr` and type `fizzbuzz` at the prompt.
fizzbuzz has no value, but it does have a type, which idris will show you

-}

data Fizz : Type where
data Buzz : Type where
data FizzBuzz : Type where

data N : Nat -> Type where

tt : Nat -> Nat -> Type
tt l n = next l n where
  fb : Type
  fb with ((mod n 3) == 0, (mod n 5) == 0)
    | (False, False) = N n
    | (True,  False) = Fizz
    | (False, True ) = Buzz
    | (True,  True ) = FizzBuzz
  next Z n = fb
  next (S l) n = fb -> (tt l (S n))

fizzbuzz : (tt 99 1)
