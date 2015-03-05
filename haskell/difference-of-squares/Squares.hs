module Squares (sumOfSquares, squareOfSums, difference) where

squareOfSums :: Integral a => a -> a
squareOfSums n = n' * n'
  where
    n' = round (fromIntegral (n * (n + 1)) / 2 :: Double)

sumOfSquares :: Integral a => a -> a
sumOfSquares n = round (fromIntegral (n * (n + 1) * (2 * n + 1)) / 6 :: Double)

difference :: Integral a => a -> a
difference n = squareOfSums n - sumOfSquares n