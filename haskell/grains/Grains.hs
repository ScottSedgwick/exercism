module Grains (square, total) where

square :: (Integral b, Num a) => b -> a
square x = 2 ^ (x - 1)

total :: Integer
total = 2 ^ (64 :: Integer) - 1

-- Because:
-- the sum of K = 0..N-1 of A * R ^ K
-- = A * (1 - R ^ N) / (1 - R)
-- substituting A = 1, R = 2, N = 64
-- = 1 * (1 - 2 ^ 64) / (1 - 2)
-- = (1 - 2 ^ 64) / -1
-- = 2 ^ 64 - 1.