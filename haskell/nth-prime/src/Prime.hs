module Prime (nth) where

nth :: Int -> Maybe Integer
nth n | n < 1 = Nothing
      | otherwise = Just $ primes !! (n - 1)

-- Naive generation of list of primes.  Faster than the sieve of
-- Eratosthenes, but still not fantastic.

primes :: [Integer]
primes = 2 : [x | x <- [3,5..], isPrime x]

isPrime :: Integer -> Bool
isPrime k = null [ x | x <- [2..isqrt k], k `mod`x  == 0]

isqrt :: Integer -> Integer
isqrt = floor . sqrt . fromIntegral