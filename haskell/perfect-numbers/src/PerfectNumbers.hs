module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x | x <= 0 = Nothing
           | s <  x = Just Deficient
           | s == x = Just Perfect
           | s >  x = Just Abundant
  where
    s = aliquont_sum x
        
aliquont_sum :: Int -> Int
aliquont_sum x = sum [y | y <- [1..x `div` 2], x `mod` y == 0]