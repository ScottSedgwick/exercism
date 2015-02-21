module Beer ( sing, verse ) where

import Data.Composition ( compose2 )

sing :: Integer -> Integer -> String
sing = (unlines . map verse . reverse) `compose2` flip enumFromTo

-- Original form - before pointfree and compose2 struck.
-- sing a b = unlines $ map verse $ reverse $ flip enumFromTo a b

verse :: Integer -> String
verse 0 = "No more bottles of beer on the wall, no more bottles of beer.\n" ++ 
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
verse 1 = "1 bottle of beer on the wall, 1 bottle of beer.\n" ++ 
          "Take it down and pass it around, no more bottles of beer on the wall.\n"
verse 2 = "2 bottles of beer on the wall, 2 bottles of beer.\n" ++ 
          "Take one down and pass it around, 1 bottle of beer on the wall.\n"
verse n = show n ++ " bottles of beer on the wall, " ++ show n ++ " bottles of beer.\n" ++ 
          "Take one down and pass it around, " ++ show (n-1) ++ " bottles of beer on the wall.\n"