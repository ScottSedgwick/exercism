module Prime (nth) where

nth :: Int -> Maybe Integer
nth n | n < 1 = Nothing
      | otherwise = Just $ primes !! (n - 1)

-- Naive generation of list of primes.  Faster than the sieve of
-- Eratosthenes, but still not fantastic.

primes :: [Integer]
primes = filter isPrime [2..]

isPrime :: Integer -> Bool
isPrime k = null [ x | x <- [2..isqrt k], k `mod`x  == 0]

isqrt :: Integer -> Integer
isqrt = floor . sqrt . fromIntegral