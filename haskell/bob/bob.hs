module Bob ( responseFor ) where 

import Data.Char (isSpace, toUpper)

upper :: String -> String
upper = map toUpper

strip :: String -> String
strip = lstrip . rstrip

lstrip :: String -> String
lstrip = dropWhile isSpace

rstrip :: String -> String
rstrip = reverse . lstrip . reverse

data StatementType = Silence | Yell | Query | Other
  
typeOfStatement :: String -> StatementType
typeOfStatement s
  | null s        = Silence
  | upper s == s  = Yell
  | last s == '?' = Query
  | otherwise     = Other

bobSaysFor :: StatementType -> String
bobSaysFor Silence = "Fine. Be that way!"
bobSaysFor Yell    = "Whoa, chill out!"
bobSaysFor Query   = "Sure."
bobSaysFor Other   = "Whatever."

responseFor :: String -> String
responseFor = bobSaysFor . typeOfStatement . strip