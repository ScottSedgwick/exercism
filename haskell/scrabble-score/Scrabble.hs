module Scrabble (scoreLetter, scoreWord) where

import qualified Data.Map as M
import Data.Char (toUpper, digitToInt, isDigit)

tileValues :: M.Map Char Int
tileValues = M.fromList [
    ('A', 1), ('E', 1), ('I', 1), ('O', 1), ('U', 1), ('L', 1), ('N', 1), ('R', 1), ('S', 1), ('T', 1),
    ('D', 2), ('G', 2),
    ('B', 3), ('C', 3), ('M', 3), ('P', 3),
    ('F', 4), ('H', 4), ('V', 4), ('W', 4), ('Y', 4),
    ('K', 5),
    ('J', 8), ('X', 8),
    ('Q', 10), ('Z', 10)
  ]

-- I have created a syntax for marking up bonus squares:
-- Double and Triple word multipliers are marked by a number preceding the word (2 or 3).  No preceding number means no word multiplier.
-- Double and Triple letter multipliers are marked by a number trailing the letter.

-- There is a special case in parseWord to allow for 2 digit word multipliers at the start.  This can only happen if
--  the player puts down a 15 character word that goes across 3 triple word scores (giving a multiplier of 27).

class Scoreable a where
	score :: a -> Int

data Letter = Letter Int Char  -- Letter multiplier and letter

instance Scoreable Letter where
  score (Letter m c) = m * M.findWithDefault 0 (toUpper c) tileValues

data Word = Word Int [Letter]  -- Word multiplier and letters

instance Scoreable Word where
  score (Word m ls) = m * sum (map score ls)

pairChars :: String -> [(Char, Char)]
pairChars s = zip s $ tail s ++ "1"

parsePair :: (Char, Char) -> Letter
parsePair (c, m) | isDigit m = Letter (digitToInt m) c
                 | otherwise = Letter 1 c

parseLetters :: String -> [Letter]
parseLetters = map parsePair . pairChars

parseWord :: String -> Word
parseWord (a:b:cs) | isDigit a && isDigit b = Word (digitToInt a * 10 + digitToInt b) $ parseLetters cs
                   | isDigit a              = Word (digitToInt a) $ parseLetters (b:cs)
parseWord s = Word 1 $ parseLetters s

scoreLetter :: Char -> Int
scoreLetter = score . Letter 1

scoreWord :: String -> Int
scoreWord = score . parseWord