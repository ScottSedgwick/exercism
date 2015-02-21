module LeapYear (isLeapYear) where

(%?) :: Int -> Int -> Bool
(%?) n d = n `mod` d == 0

isLeapYear :: Int -> Bool
isLeapYear y = y %? 400 
            || y %? 4 && not (y %? 100)