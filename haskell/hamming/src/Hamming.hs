module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys =
  if length xs /= length ys then Nothing
  else return $ length $ filter (\(x,y) -> x /= y) $ zip xs ys