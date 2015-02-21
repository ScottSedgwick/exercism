{-# LANGUAGE TupleSections #-}

module DNA (count, nucleotideCounts) where

import Data.Function (on)
import Data.Map (Map, fromList, fromListWith, unionWith)
import Text.Printf (printf)

count :: Char -> String -> Int
count c = length . filter (isValidN c) 

nucleotideCounts :: String -> Map Char Int
nucleotideCounts = unionWith (+) nullDna . countedDna

nullDna :: Map Char Int
nullDna = fromList $ map (,0) "ACGT"

isValidN :: Char -> Char -> Bool
isValidN = (==) `on` validN

validN :: Char -> Char
validN c | c `elem` "GATCU" = c
          | otherwise        = error (printf "invalid nucleotide '%c'" c)

countedDna :: String -> Map Char Int
countedDna = fromListWith (+) . map ((,1) . validN)