module Sieve (primesUpTo) where

primesUpTo :: Integer -> [Integer]
primesUpTo n = sieve [2..n]
  where 
    sieve [] = []
    sieve (x:xs) = x : sieve (filter (\y -> y `mod` x /= 0) xs)
