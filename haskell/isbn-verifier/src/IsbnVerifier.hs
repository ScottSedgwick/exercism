module IsbnVerifier (isbn, calcIsbn10, isbn10to13, calcIsbn13) where

import Data.Char (isDigit, digitToInt, intToDigit)

isbn :: String -> Bool
isbn cs = (l == 10) && xOnlyLast ds && validIsbn xs
  where
    ds = filter (\d -> isDigit d || d == 'X') cs
    l  = length ds
    xs = map xToDigit ds

xOnlyLast :: String -> Bool
xOnlyLast = notElem 'X' . init

xToDigit :: Char -> Int
xToDigit 'X' = 10
xToDigit d   = digitToInt d

validIsbn :: [Int] -> Bool
validIsbn xs = s `mod` 11 == 0
  where
    s = sum $ zipWith (*) xs [10,9..1]

-- Bonus work
calcIsbn10 :: [Int] -> Maybe String
calcIsbn10 xs | length xs == 9 = Just $ map intToDigit (xs ++ [j])
              | otherwise      = Nothing
  where 
    j = 11 - (s `mod` 11)
    s = sum $ zipWith (*) xs [10,9..2]

isbn10to13 :: String -> Maybe String
isbn10to13 xs | isbn xs   = calcIsbn13 $ [9,7,8] ++ map digitToInt (init xs)
              | otherwise = Nothing

calcIsbn13 :: [Int] -> Maybe String
calcIsbn13 xs | length xs == 12 = Just $ map intToDigit (xs ++ [j])
              | otherwise       = Nothing
  where 
    j = 10 - (s `mod` 10)
    s = sum $ zipWith (*) xs [1,3,1,3,1,3,1,3,1,3,1,3]