module FoodChain (song) where

import Data.List (intercalate, tails)

descriptors :: [String]
descriptors = 
    [ ""
    , "spider.\nIt wriggled and jiggled and tickled inside her."
    , "bird.\nHow absurd to swallow a bird!"
    , "cat.\nImagine that, to swallow a cat!"
    , "dog.\nWhat a hog, to swallow a dog!"
    , "goat.\nJust opened her throat and swallowed a goat!"
    , "cow.\nI don't know how she swallowed a cow!"
    ]

swallowData :: [(String, String)]
swallowData =    
    [ ("cow", "goat.\n")
    , ("goat", "dog.\n")
    , ("dog", "cat.\n")
    , ("cat", "bird.\n")
    , ("bird", "spider that wriggled and jiggled and tickled inside her.\n")
    , ("spider", "")
    ]

swallows :: [String]
swallows = reverse $ map buildSwallows $ tails swallowData

buildSwallows :: [(String, String)] -> String
buildSwallows = concatMap (\(a,b) -> "She swallowed the " ++ a ++ " to catch the " ++ b)

wrapVerse :: String -> String -> String
wrapVerse d s = "I know an old lady who swallowed a " 
              ++ (if (d == "") || (s == "") then "" else d ++ "\n" ++ s) 
              ++ "fly.\nI don't know why she swallowed the fly. Perhaps she'll die."

verses :: [String]
verses = zipWith wrapVerse descriptors swallows ++ ["I know an old lady who swallowed a horse.\nShe's dead, of course!\n"]

song :: String
song = intercalate "\n\n" verses
