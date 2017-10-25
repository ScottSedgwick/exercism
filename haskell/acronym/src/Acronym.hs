module Acronym (abbreviate) where

import Data.Char (isAlpha, isUpper, toLower, toUpper)
import Data.Maybe (catMaybes)

abbreviate :: String -> String
abbreviate xs = head $ catMaybes [acronymDefined xs, generateAcronym xs]

-- If the first word is all caps and ends with a colon, it is the acronym for 
-- the remainder of the string.  Just output it (without the colon).
acronymDefined :: String -> Maybe String
acronymDefined xs = if xs /= [] && isAcronym word1
                    then Just $ init word1
                    else Nothing
  where
    word1 = head $ words xs

isAcronym :: String -> Bool
isAcronym xs = xs /= [] && last xs == ':' && all isUpper (init xs)

-- Otherwise generate the acronym.
-- 1. Remove any punctuation - replace with a space
-- 2. Make sure all words in the sentence start with a capital.
--    Any words that are all caps, make only the first letter cap.
-- 3. Filter out all non-cap characters.
generateAcronym :: String -> Maybe String
generateAcronym xs = Just as
  where
    ys = map (\c -> if isAlpha c then c else ' ') xs
    zs = unwords $ map capitalize $ words ys
    as = filter isUpper zs

capitalize :: String -> String
capitalize (x:xs) = toUpper x : if all isUpper xs then map toLower xs else xs