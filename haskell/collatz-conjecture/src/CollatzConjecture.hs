module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz x | x < 1     = Nothing
          | x == 1    = Just 0
          | otherwise = (+1) <$> collatz x'
  where x' = if (x `mod` 2) == 0 then x `div` 2 else x * 3 + 1
