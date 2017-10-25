module Squares (sumOfSquares, squareOfSums, difference) where

squareOfSums :: (Integral a) => a -> a
squareOfSums n = (n * (n + 1) `div` 2) ^ (2 :: Integer)

sumOfSquares :: Integral a => a -> a
sumOfSquares n = n * (n + 1) * (2 * n + 1) `div` 6

difference :: Integral a => a -> a
difference n = squareOfSums n - sumOfSquares n