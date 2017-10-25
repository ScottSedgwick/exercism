module CryptoSquare (normalizePlaintext,
                     squareSize,
                     plaintextSegments,
                     ciphertext,
                     normalizeCiphertext,
                     rotateSquare)
where

import Data.Char (isAlphaNum, toLower)
import Data.List (transpose)
import Data.List.Split (chunksOf)
import Data.Maybe (mapMaybe)

maybeAlphaNum :: Char -> Maybe Char
maybeAlphaNum c | isAlphaNum c = Just $ toLower c
                | otherwise    = Nothing

normalizePlaintext :: String -> String
normalizePlaintext = mapMaybe maybeAlphaNum

squareSize :: String -> Int
squareSize = ceiling . (sqrt :: Double -> Double) . fromIntegral . length

plaintextSegments :: String -> [String]
plaintextSegments s = chunksOf i n
                    where n = normalizePlaintext s
                          i = squareSize n

ciphertext :: String -> String
ciphertext = concat . rotateSquare

normalizeCiphertext :: String -> String
normalizeCiphertext = unwords . rotateSquare

rotateSquare :: String -> [String]
rotateSquare = transpose . plaintextSegments