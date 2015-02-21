module Raindrops (convert) where

import Data.Numbers.Primes (primeFactors)
import Data.List (group, sort)

rmdups :: (Ord a) => [a] -> [a]
rmdups = map head . group . sort

f2p :: Integer -> String
f2p 3 = "Pling"
f2p 5 = "Plang"
f2p 7 = "Plong"
f2p _ = ""

ppp :: Integer -> String
ppp = concatMap f2p . rmdups . primeFactors

convert :: Integer -> String
convert x | s == ""   = show x
          | otherwise = s
          where s = ppp x