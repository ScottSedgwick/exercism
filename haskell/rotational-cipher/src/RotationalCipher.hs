module RotationalCipher (rotate) where

import Data.Maybe (catMaybes)

rot :: Int -> Char -> [Char] -> Maybe Char
rot n c cs = if c `elem` cs
             then Just $ head $ drop n $ dropWhile (\x -> x /= c) $ cycle cs
             else Nothing

rotate :: Int -> String -> String
rotate n = map f
  where
    f c = head $ catMaybes [rot n c ['A'..'Z'], rot n c ['a'..'z'], Just c]
