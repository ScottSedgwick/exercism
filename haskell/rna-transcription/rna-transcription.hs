module DNA ( toRNA ) where

import Data.String.Utils (replace)

toRNA :: String -> String
toRNA = replace "T" "U"