{-# LANGUAGE TupleSections #-}

module WordCount (wordCount) where

import Data.Map (Map, fromListWith)
import Data.Char (isAlphaNum, toLower)
import Data.List.Split (wordsBy)

isAlphaNumApos :: Char -> Bool
isAlphaNumApos '\'' = True
isAlphaNumApos c    = isAlphaNum c

wordCount :: String -> Map String Int
wordCount = fromListWith (+) . wordCounts

wordCounts :: String -> [(String, Int)]
wordCounts = map (,1) . wordsBy (not . isAlphaNumApos) . map toLower