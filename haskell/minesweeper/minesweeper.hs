module Minesweeper (annotate, toGrid) where

import qualified Data.Map as Map

type Coord = (Int, Int)

annotate :: [String] -> [String]
annotate = undefined

toGrid :: [String] -> Map.Map Coord (Maybe Int)
toGrid = insertGrid 0 Map.empty

insertGrid :: Int -> Map.Map Coord (Maybe Int) -> [String] -> Map.Map Coord (Maybe Int)
insertGrid _ m [] = m
insertGrid y m (s:ss) = insertGrid (y + 1) (insertRow y 0 m s) ss

insertRow :: Int -> Int -> Map.Map Coord (Maybe Int) -> String -> Map.Map Coord (Maybe Int)
insertRow _ _ m [] = m
insertRow y x m (c:cs) = insertRow y (x + 1) (Map.insert (x, y) (encodeChar c) m) cs

encodeChar :: Char -> Maybe Int
encodeChar '*' = Nothing
encodeChar _ = Just 0
