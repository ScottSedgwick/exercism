module Luhn (
    checkDigit,
    addends,
    checksum,
    isValid,
    create,
    ) where

import           Data.Digits (digits)

checkDigit :: Integer -> Integer
checkDigit = flip mod 10

reduce :: Integer -> Integer
reduce x
  | x < 10 = x
  | otherwise = reduce $ x - 9

double :: Integer -> Integer
double = reduce . (2 *)

double2nds :: [Integer] -> [Integer]
double2nds (a:b:xs) = a : double b : double2nds xs
double2nds xs = xs

addends :: Integer -> [Integer]
addends = reverse . double2nds . reverse . digits 10

checksum :: Integer -> Integer
checksum = flip mod 10 . sum . addends

isValid :: Integer -> Bool
isValid = (0 ==) . checksum

create :: Integer -> Integer
create x = x10 + c
  where
    x10 = x * 10
    c10 = checksum x10
    c = if c10 `mod` 10 == 0
          then 0
          else 10 - c10