module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where

import Data.List (any)

isMultiple :: [Integer] -> Integer -> Bool
isMultiple factors x = any (\f -> x `mod` f == 0) factors

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors upTo = sum [ x | x <- [1.. upTo - 1], isMultiple factors x ] 

sumOfMultiplesDefault :: Integer -> Integer
sumOfMultiplesDefault = sumOfMultiples [3,5]