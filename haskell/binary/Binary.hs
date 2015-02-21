module Binary (toDecimal) where

import Data.List (foldl')

toDecimal :: String -> Int
toDecimal = foldl' (\acc ch -> acc * 2 + charToBinary ch) 0

charToBinary :: Char -> Int
charToBinary '1' = 1
charToBinary  _  = 0
