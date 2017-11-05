module OCR (convert) where

import Data.List (intercalate)

convert :: String -> String
convert xs = intercalate "," numbers
  where
    numbers = map convertLine (splitIntoN 4 (lines xs))
        
splitIntoN :: Int -> [a] -> [[a]]
splitIntoN _ [] = []
splitIntoN n xs = take n xs : splitIntoN n (drop n xs)

convertLine :: [String] -> String
convertLine xs = 
    if length xs /= 4
    then "?"
    else convertZip $ zip3 (xs !! 0) (xs !! 1) (xs !! 2) 

convertZip :: [(Char, Char, Char)] -> String
convertZip xs | length xs == 0 = ""
              | length xs < 3  = "?"
              | otherwise      = convertDigit (take 3 xs) ++ convertZip (drop 3 xs)

convertDigit :: [(Char, Char, Char)] -> String
convertDigit xs | xs == ocrZero  = "0"
                | xs == ocrOne   = "1"
                | xs == ocrTwo   = "2"
                | xs == ocrThree = "3"
                | xs == ocrFour  = "4"
                | xs == ocrFive  = "5"
                | xs == ocrSix   = "6"
                | xs == ocrSeven = "7"
                | xs == ocrEight = "8"
                | xs == ocrNine  = "9"
                | otherwise      = "?"

ocrZero :: [(Char, Char, Char)]
ocrZero =   [ (' ', '|', '|')
            , ('_', ' ', '_') 
            , (' ', '|', '|')
            ]

ocrOne :: [(Char, Char, Char)]
ocrOne =    [ (' ', ' ', ' ')
            , (' ', ' ', ' ') 
            , (' ', '|', '|')
            ]
            
ocrTwo :: [(Char, Char, Char)]
ocrTwo =    [ (' ', ' ', '|')
            , ('_', '_', '_') 
            , (' ', '|', ' ')
            ]
            
ocrThree :: [(Char, Char, Char)]
ocrThree =  [ (' ', ' ', ' ')
            , ('_', '_', '_') 
            , (' ', '|', '|')
            ]

ocrFour :: [(Char, Char, Char)]
ocrFour =   [ (' ', '|', ' ')
            , (' ', '_', ' ') 
            , (' ', '|', '|')
            ]

ocrFive :: [(Char, Char, Char)]
ocrFive =   [ (' ', '|', ' ')
            , ('_', '_', '_') 
            , (' ', ' ', '|')
            ]

ocrSix :: [(Char, Char, Char)]
ocrSix =    [ (' ', '|', '|')
            , ('_', '_', '_') 
            , (' ', ' ', '|')
            ]

ocrSeven :: [(Char, Char, Char)]
ocrSeven =  [ (' ', ' ', ' ')
            , ('_', ' ', ' ') 
            , (' ', '|', '|')
            ]
           
ocrEight :: [(Char, Char, Char)]
ocrEight =  [ (' ', '|', '|')
            , ('_', '_', '_') 
            , (' ', '|', '|')
            ]
           
ocrNine :: [(Char, Char, Char)]
ocrNine =   [ (' ', '|', ' ')
            , ('_', '_', '_') 
            , (' ', '|', '|')
            ]
                                                                                                                                               