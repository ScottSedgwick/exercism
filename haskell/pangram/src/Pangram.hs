module Pangram (isPangram) where

import Data.Char (toLower, isAlpha)
import Data.List (nub, sort)

isPangram :: String -> Bool
isPangram text = ['a'..'z'] == (sort $ nub $ map toLower $ filter isAlpha text)
