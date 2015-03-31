module Minesweeper (
  annotate
  , toGrid
  , toInt
) where

import Data.List

annotate :: [String] -> [String]
annotate = undefined

toGrid :: [String] -> [[Int]]
toGrid ss = map (\s -> map (\c -> toInt c) s) ss

toInt :: Char -> Int
toInt c | c == '1' = 1
        | c == '2' = 2
        | c == '3' = 3
        | c == '4' = 4
        | c == '5' = 5
        | c == '6' = 6
        | c == '7' = 7
        | c == '8' = 8
        | c == '9' = 9
        | c == '*' = -1
        | otherwise = 0

line :: Int -> [String] -> String
line i xs | i < 0 = []
          | i >= length xs = []
          | otherwise = xs !! i

segment :: Int -> String -> String
segment i xs | i == 0 = take 2 $ drop (i - 1) xs
             | otherwise = take 3 $ drop (i - 1) xs

surround :: Int -> Int -> [String] -> String
surround row col xs = concat [above, this, below]
  where above = segment col $ line (row - 1) xs
        this  = segment col $ line row xs
        below = segment col $ line (row + 1) xs

mines :: Int -> Int -> [String] -> Int
mines row col xs = length $ filter (\c -> c == '*') $ surround row col xs

table = ["123456789", "234567890", "345678901", "456789012"]
ztable = (take 2 table) : (init $ init $ map (\xs -> take 3 xs) $ tails table)

zipem (a:b:[]) = zip a b
zipem (a:b:c)  = zip3 a b c