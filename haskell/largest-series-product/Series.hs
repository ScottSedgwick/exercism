module Series (digits, slices, largestProduct) where

import           Data.Char (digitToInt)

digits :: String -> [Int]
digits = map digitToInt

slices :: Int -> String -> [[Int]]
slices n cs
  | n < 1 = []
  | n > length cs = []
  | otherwise = digits (take n cs) : slices n (tail cs)

largestProduct :: Int -> String -> Int
largestProduct = ((biggest . map product) .) . slices
  where
    biggest [] = 1
    biggest xs = maximum xs