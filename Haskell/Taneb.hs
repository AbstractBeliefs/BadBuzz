{-# LANGUAGE RankNTypes #-}
module FizzBuzz2 where

import Prelude hiding (pred, Num)

type Num = forall a. (a -> a) -> a -> a

fix :: ((Num -> a -> a -> a) -> Num -> a -> a -> a) -> Num -> a -> a -> a
fix f = f (fix f)

fixx :: ((Num -> Num -> (s -> n -> n) -> n -> (a -> s) -> (a -> a) -> a -> s -> s -> s -> n) -> Num -> Num -> (s -> n -> n) -> n -> (a -> s) -> (a -> a) -> a -> s -> s -> s -> n) -> Num -> Num -> (s -> n -> n) -> n -> (a -> s) -> (a -> a) -> a -> s -> s -> s -> n
fixx f = f (fixx f)

pred :: Num -> Num
pred n f x = n (\g h -> h (g f)) (const x) id

iszero :: Num -> a -> a -> a
iszero n = n (\_ -> const id) const

isfizz :: (Num -> a -> a -> a) -> Num -> a -> a -> a
isfizz r n t f = iszero n t (let pn = pred n in iszero pn f (let ppn = pred pn in iszero ppn f (r (pred ppn) t f)))

isbuzz :: (Num -> a -> a -> a) -> Num -> a -> a -> a
isbuzz r n t f = iszero n t (let pn = pred n in iszero pn f (let ppn = pred pn in iszero ppn f (let pppn = pred ppn in iszero pppn f (let ppppn = pred pppn in iszero ppppn f (r (pred ppppn) t f)))))

fizzbuzz :: Num -> (a -> s) -> (a -> a) -> a -> s -> s -> s -> s
fizzbuzz n s p1 z f b fb = fix isfizz n (fix isbuzz n fb f) (fix isbuzz n b (s (n p1 z)))

fizzbuzzes :: (Num -> Num -> (s -> n -> n) -> n -> (a -> s) -> (a -> a) -> a -> s -> s -> s -> n) -> Num -> Num -> (s -> n -> n) -> n -> (a -> s) -> (a -> a) -> a -> s -> s -> s -> n
fizzbuzzes rr lim n bnd r s p1 z f b fb = iszero lim r (bnd (fizzbuzz n s p1 z f b fb) (rr (pred lim) (\f -> f . n f) bnd r s p1 z f b fb))

hundred :: Num
hundred = (\f g -> f . g . f . g) (\f -> f . f) (\f -> f . f . f . f . f)

main :: IO ()
main = fixx fizzbuzzes hundred id (\s n -> putStrLn s >> n) (return ()) show succ 0 "fizz" "buzz" "fizzbuzz"
