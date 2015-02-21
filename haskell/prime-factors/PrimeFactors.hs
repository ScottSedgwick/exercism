module PrimeFactors (primeFactors) where

import Data.Numbers.Primes (primes)

factors :: Integer -> [Integer] -> [Integer]
factors 1 _      = []
factors v (p:ps) | r == 0     = p : factors q (p:ps)
                 | otherwise  = factors v ps
                 where (q, r) = quotRem v p

primeFactors :: Integer -> [Integer]
primeFactors x = factors x primes
