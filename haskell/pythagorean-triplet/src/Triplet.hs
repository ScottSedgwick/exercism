module Triplet (isPythagorean, mkTriplet, pythagoreanTriplets) where

import Data.List (delete, sort)

isPythagorean :: (Int, Int, Int) -> Bool
isPythagorean (a, b, c) = (c * c) == (a * a) + (b * b)

mkTriplet :: Int -> Int -> Int -> (Int, Int, Int)
mkTriplet a b c = (x, y, z)
  where
    z = maximum [a,b,c]
    [x,y] = delete z [a,b,c]

pythagoreanTriplets :: Int -> Int -> [(Int, Int, Int)]
pythagoreanTriplets minFactor maxFactor = sort [(x,y,z) | z <- [minFactor..maxFactor]
                                                        , y <- [minFactor..z]
                                                        , x <- [minFactor..y]
                                                        , isPythagorean (x,y,z)]
