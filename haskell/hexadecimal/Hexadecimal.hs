module Hexadecimal (hexToInt) where

--import           Data.Char (digitToInt, isHexDigit)
import           Data.Char (ord)
import           Data.List (foldl')

hexToInt :: String -> Int
hexToInt s = if all isHexDigit s
               then foldl' (\acc c -> acc * 16 + digitToInt c) 0 s
               else 0

digits :: String
digits = "0123456789"

hexchars :: String
hexchars = "abcdef"

hexCHARS :: String
hexCHARS = "ABCDEF"

isHexDigit :: Char -> Bool
isHexDigit c = c `elem` digits || c `elem` hexchars || c `elem` hexCHARS

digitToInt :: Char -> Int
digitToInt c
  | c `elem` digits = ord c - ord '0'
  | c `elem` hexchars = ord c - ord 'a' + 10
  | c `elem` hexCHARS = ord c - ord 'A' + 10
  | otherwise = error $ c : " is not  valid digit."