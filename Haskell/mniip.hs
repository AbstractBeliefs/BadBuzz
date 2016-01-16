{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies, FlexibleInstances, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fcontext-stack=300 #-}
-- Raise the typechecker stack size. Don't set this too high or you will OOM

-- FizzBuzz limit
type Max = AddTen (AddTen (AddTen (AddTen (AddTen Z))))

data CharNewline
data Char0
data Char1
data Char2
data Char3
data Char4
data Char5
data Char6
data Char7
data Char8
data Char9
data CharB
data CharF
data CharI
data CharU
data CharZ

class DemoteChar a where demoteChar :: a -> Char

instance DemoteChar CharNewline where demoteChar _ = '\n'
instance DemoteChar Char0 where demoteChar _ = '0'
instance DemoteChar Char1 where demoteChar _ = '1'
instance DemoteChar Char2 where demoteChar _ = '2'
instance DemoteChar Char3 where demoteChar _ = '3'
instance DemoteChar Char4 where demoteChar _ = '4'
instance DemoteChar Char5 where demoteChar _ = '5'
instance DemoteChar Char6 where demoteChar _ = '6'
instance DemoteChar Char7 where demoteChar _ = '7'
instance DemoteChar Char8 where demoteChar _ = '8'
instance DemoteChar Char9 where demoteChar _ = '9'
instance DemoteChar CharB where demoteChar _ = 'B'
instance DemoteChar CharF where demoteChar _ = 'F'
instance DemoteChar CharI where demoteChar _ = 'I'
instance DemoteChar CharU where demoteChar _ = 'U'
instance DemoteChar CharZ where demoteChar _ = 'Z'

data Nil
data Cons a as

class DemoteString a where
	demoteString :: a -> String

instance DemoteString Nil where
	demoteString _ = []
instance (DemoteChar a, DemoteString as) => DemoteString (Cons a as) where
	demoteString x = demoteChar ((undefined :: Cons a as -> a) x) : demoteString ((undefined :: a as -> as) x)

class Append a b c | a b -> c

instance Append Nil as as
instance Append as bs cs => Append (Cons a as) bs (Cons a cs)

data Z
data S a

class DecimalShift a b | a -> b

instance DecimalShift Z Z
instance DecimalShift (S Z) Z
instance DecimalShift (S (S Z)) Z
instance DecimalShift (S (S (S Z))) Z
instance DecimalShift (S (S (S (S Z)))) Z
instance DecimalShift (S (S (S (S (S Z))))) Z
instance DecimalShift (S (S (S (S (S (S Z)))))) Z
instance DecimalShift (S (S (S (S (S (S (S Z))))))) Z
instance DecimalShift (S (S (S (S (S (S (S (S Z)))))))) Z
instance DecimalShift (S (S (S (S (S (S (S (S (S Z))))))))) Z
instance DecimalShift a b => DecimalShift (S (S (S (S (S (S (S (S (S (S a)))))))))) (S b)

class DecimalMod a b | a -> b

instance DecimalMod Z Z
instance DecimalMod (S Z) (S Z)
instance DecimalMod (S (S Z)) (S (S Z))
instance DecimalMod (S (S (S Z))) (S (S (S Z)))
instance DecimalMod (S (S (S (S Z)))) (S (S (S (S Z))))
instance DecimalMod (S (S (S (S (S Z))))) (S (S (S (S (S Z)))))
instance DecimalMod (S (S (S (S (S (S Z)))))) (S (S (S (S (S (S Z))))))
instance DecimalMod (S (S (S (S (S (S (S Z))))))) (S (S (S (S (S (S (S Z)))))))
instance DecimalMod (S (S (S (S (S (S (S (S Z)))))))) (S (S (S (S (S (S (S (S Z))))))))
instance DecimalMod (S (S (S (S (S (S (S (S (S Z))))))))) (S (S (S (S (S (S (S (S (S Z)))))))))
instance DecimalMod a b => DecimalMod (S (S (S (S (S (S (S (S (S (S a)))))))))) b

class ShowD a b | a -> b

instance ShowD Z Char0
instance ShowD (S Z) Char1
instance ShowD (S (S Z)) Char2
instance ShowD (S (S (S Z))) Char3
instance ShowD (S (S (S (S Z)))) Char4
instance ShowD (S (S (S (S (S Z))))) Char5
instance ShowD (S (S (S (S (S (S Z)))))) Char6
instance ShowD (S (S (S (S (S (S (S Z))))))) Char7
instance ShowD (S (S (S (S (S (S (S (S Z)))))))) Char8
instance ShowD (S (S (S (S (S (S (S (S (S Z))))))))) Char9

class ShowN a b | a -> b

instance ShowN Z Nil
instance (DecimalMod (S a) b, ShowD b c, DecimalShift (S a) e, ShowN e f, Append f (Cons c Nil) g) => ShowN (S a) g

data True
data False

class IsFizz a b | a -> b

instance IsFizz Z True
instance IsFizz (S Z) False
instance IsFizz (S (S Z)) False
instance IsFizz a b => IsFizz (S (S (S a))) b

class IsBuzz a b | a -> b

instance IsBuzz Z True
instance IsBuzz (S Z) False
instance IsBuzz (S (S Z)) False
instance IsBuzz (S (S (S Z))) False
instance IsBuzz (S (S (S (S Z)))) False
instance IsBuzz a b => IsBuzz (S (S (S (S (S a))))) b

class ChooseString a b c d | a b c -> d

instance ShowN a b => ChooseString False False a b
instance ChooseString True False a (Cons CharF (Cons CharI (Cons CharZ (Cons CharZ Nil))))
instance ChooseString False True a (Cons CharB (Cons CharU (Cons CharZ (Cons CharZ Nil))))
instance (ChooseString True False a b, ChooseString False True a c, Append b c d) => ChooseString True True a d

class GetString a b | a -> b

instance (IsFizz a b, IsBuzz a c, ChooseString b c a d) => GetString a d

class FizzBuzz a b | a -> b

instance FizzBuzz Z Nil
instance (FizzBuzz a b, GetString (S a) c, Append c (Cons CharNewline Nil) d, Append b d e) => FizzBuzz (S a) e

type AddTen a = S (S (S (S (S (S (S (S (S (S a)))))))))

fizzbuzz :: FizzBuzz Max r => r
fizzbuzz = fizzbuzz

main = putStr (demoteString fizzbuzz)
