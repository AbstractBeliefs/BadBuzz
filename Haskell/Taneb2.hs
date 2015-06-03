{-# LANGUAGE NPlusKPatterns #-}
module FizzBuzz where

isFizz :: Int -> Bool
isFizz 0 = True
isFizz 1 = False
isFizz 2 = False
isFizz (n + 3) = isFizz n

isBuzz :: Int -> Bool
isBuzz 0 = True
isBuzz 1 = False
isBuzz 2 = False
isBuzz 3 = False
isBuzz 4 = False
isBuzz (n + 5) = isBuzz n

fizzbuzz :: Int -> [String]
fizzbuzz 0 = []
fizzbuzz (n+1) = fizzbuzz n ++ case isFizz n of
  True -> case isBuzz n of
    True -> ["fizzbuzz"]
    False -> ["fizz"]
  False -> case isBuzz n of
    True -> ["buzz"]
    False -> [show n]

main :: IO ()
main = do
  mapM_ (\n -> putStrLn $ last $ fizzbuzz n) [1..100]
