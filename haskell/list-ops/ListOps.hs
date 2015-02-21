module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ z [] = z
foldl' f z (x:xs) = z' `seq` foldl' f z' xs
                  where z' = z `f` x 

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ z [] = z
foldr f z (x:xs) = x `f` foldr f z xs

length :: [a] -> Int
length = foldl' (\z _ -> z + 1) 0

reverse :: [a] -> [a]
reverse = foldl' (flip (:)) []

map :: (a -> b) -> [a] -> [b]
map f = foldr (\x z -> f x : z) []

filter :: (a -> Bool) -> [a] -> [a]
filter f = foldr (\x z -> if f x then x : z else z) []

(++) :: [a] -> [a] -> [a]
(++) = flip $ foldr (:)

concat :: [[a]] -> [a]
concat = foldr (++) []
