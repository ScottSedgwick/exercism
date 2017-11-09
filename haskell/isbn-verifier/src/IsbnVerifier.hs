module IsbnVerifier (isbn, calcIsbn10, isbn10to13, calcIsbn13) where

import Data.Char (digitToInt, intToDigit, isDigit)

-- isbn can be digits and '-', and the last character can be 'x' or 'X', too.
-- After taking out '-' chars, length should be 10.
isbn :: String -> Bool
isbn = checkLastDigit . reverse . filter (/= '-')

checkLastDigit :: String -> Bool
checkLastDigit (x:xs) | x `elem` "xX" = checkDigits 10 xs
                      | isDigit x     = checkDigits (digitToInt x) xs
                      | otherwise     = False
checkLastDigit _ = False

checkDigits :: Int -> String -> Bool
checkDigits c xs | not (all isDigit xs) = False
                 | otherwise = checkSum $ c : map digitToInt xs

checkSum :: [Int] -> Bool
checkSum xs = (sum $ zipWith (*) xs [1..10]) `mod` 11 == 0

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
    s = sum $ zipWith (*) xs (take 12 $ cycle [1,3])