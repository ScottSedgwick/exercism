module Strain (keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep f xs = [ x | x <- xs, f x ] 

discard :: (a -> Bool) -> [a] -> [a]
discard f = keep $ not . f