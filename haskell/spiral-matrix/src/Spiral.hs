module Spiral (spiral) where

import Data.Matrix (toLists, matrix)

spiral :: Int -> [[Int]]
spiral size = toLists $ matrix size size (matrixValue size)

matrixValue :: Int -> (Int, Int) -> Int
matrixValue size (r, c) 
    | r == 1    = c
    | c == size = maxForSide 1 + r
    | r == size = maxForSide 3 - c + 2
    | c == 1    = maxForSide 4 - r + 2
    | otherwise = maxForSide 4 + matrixValue (size - 2) (r - 1, c - 1)
  where 
    maxForSide x = (size - 1) * x