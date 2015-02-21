module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.Function (on)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor = filter . (isAnagramOf `on` map toLower)

isAnagramOf :: String -> String -> Bool
isAnagramOf a b = a /= b && a `isGramonymOf` b

-- I have invented a new word for this - a gramonym.  
-- It means, basically, anagram, but includes the 
-- original word itself - so banana is a gramonym of 
-- banana.
isGramonymOf :: String -> String -> Bool
isGramonymOf = (==) `on` sort