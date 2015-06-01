{-# LANGUAGE GADTs #-}

module FizzBuzz where

import Data.Typeable

data Wrapper where
  Wrap :: Typeable a => a -> Wrapper

instance Show Wrapper where
  show (Wrap w) = case (cast w, cast w :: Maybe Int) of
    (Just str, _) -> str
    (_, Just int) -> show int
    _ -> error "Type error"

fizz :: Wrapper -> Wrapper
fizz (Wrap w) = case cast w :: Maybe Int of
  Just int | mod int 3 == 0 -> Wrap ("Fizz", int)
  _ -> Wrap w

buzz :: Wrapper -> Wrapper
buzz (Wrap w) = case (cast w :: Maybe Int, cast w :: Maybe (String, Int)) of
  (Just int, _) | mod int 5 == 0 -> Wrap "Buzz"
  (_, Just (str, int)) | mod int 5 == 0 -> Wrap $ str ++ "Buzz"
                       | otherwise      -> Wrap str
  _ -> Wrap w

fizzbuzz :: [Int] -> [String]
fizzbuzz = map $ show . buzz . fizz . Wrap

main :: IO ()
main = mapM_ putStrLn $ fizzbuzz [1..100]
