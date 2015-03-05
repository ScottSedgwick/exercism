module Hexadecimal (hexToInt) where

import           Data.Char (digitToInt, isHexDigit)
import           Data.List (foldl')

hexToInt :: String -> Int
hexToInt s = if all isHexDigit s
               then foldl' (\acc c -> acc * 16 + digitToInt c) 0 s
               else 0