module Diamond (diamond) where

import Data.Char (ord)

drow :: Char -> Char -> String
drow c d = concat [left, right]
  where
    inner = replicate (ord d - ord 'A') ' '
    outer = replicate (ord c - ord d) ' '
    left  = concat [outer, [d], inner]
    right = tail $ reverse left

diamond :: Char -> [String]
diamond c = concat [top, bottom] 
  where
    top = map (drow c) ['A'..c]
    bottom = tail $ reverse top
