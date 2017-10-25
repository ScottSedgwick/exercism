module Series (slices) where

import Data.Char (digitToInt)
import Data.List (take)

slices :: Int -> String -> [[Int]]
slices 0 _  = [[]]
slices n xs = islices n $ map digitToInt xs

islices :: Int -> [Int] -> [[Int]]
islices n xs | n > length xs = []
             | otherwise     = (take n xs) : islices n (drop 1 xs)