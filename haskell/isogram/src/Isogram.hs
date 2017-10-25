module Isogram (isIsogram) where

import Data.Char (isAlpha, toLower)
import Data.List (group, sort)

isIsogram :: String -> Bool
isIsogram s = cs == [] || 2 > (maximum cs)
  where
    cs = map length $ group $ sort $ map toLower $ filter isAlpha s
