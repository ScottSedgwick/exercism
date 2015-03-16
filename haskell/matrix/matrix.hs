{-# LANGUAGE FlexibleInstances #-}

module Matrix (
    Matrix,
    row,
    column,
    rows,
    cols,
    shape,
    transpose,
    reshape,
    flatten,
    fromString,
    fromList,
    ) where

import qualified Data.List as L
import qualified Data.List.Split as S
import qualified Data.Vector as V

type Matrix a = V.Vector (V.Vector a)

class Parseable a  where
  parseLine :: String -> [a]

row :: Int -> Matrix a -> V.Vector a
row n m = m V.! n

column :: Int -> Matrix a -> V.Vector a
column n m = row n (transpose m)

rows :: Matrix a -> Int
rows = V.length

cols :: Matrix a -> Int
cols m
  | rows m == 0 = 0
  | otherwise = V.length $ V.head m

shape :: Matrix a -> (Int, Int)
shape m = (rows m, cols m)

transpose :: Matrix a -> Matrix a
transpose = fromList . L.transpose . toList

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape s = fromList . shapeList s . V.toList . flatten

shapeList :: (Int, Int) -> [a] -> [[a]]
shapeList (0, _) _ = []
shapeList (r, c) m = take c m : shapeList (r - 1, c) (drop c m)

flatten :: Matrix a -> V.Vector a
flatten = V.concat . V.toList

fromList :: [[a]] -> Matrix a
fromList = V.fromList . map V.fromList

toList :: Matrix a -> [[a]]
toList = map V.toList . V.toList

fromString :: Parseable a => String -> Matrix a
fromString = fromList . map parseLine . lines

instance Parseable Char where
  parseLine = map (\w -> read w :: Char) . words
instance Parseable [Char] where
  parseLine = filter (/= " ") . S.wordsBy (== '"')
instance Parseable Int where
  parseLine = map (\w -> read w :: Int) . words
instance Parseable Integer where
  parseLine = map (\w -> read w :: Integer) . words