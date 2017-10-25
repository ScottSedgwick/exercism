module Series (digits, slices, largestProduct) where

import           Data.Char (digitToInt)
import           Data.List (tails)

digits :: String -> [Int]
digits = map digitToInt

slices :: Int -> String -> [[Int]]
slices n = takeWhile ((==) n . length) . map (take n) . tails . digits

maxDef :: Ord a => a -> [a] -> a
maxDef d [] = d
maxDef _ xs = maximum xs

largestProduct :: Int -> String -> Int
largestProduct = ((maxDef 1 . map product) .) . slices