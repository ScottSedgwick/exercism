module Clock (fromHourMin, toString) where

import           Text.Printf

minsPerDay :: Integer
minsPerDay = 1440

data Time = Time Integer
  deriving Eq
instance Show Time where
  show t = printf "%02d:%02d" (hours t) (minutes t)
instance Num Time where
  (+) (Time t) (Time b) = fromInteger $ t + b
  (*) (Time t) (Time b) = fromInteger $ t * b
  abs (Time t) = Time $ abs t
  signum (Time t) = Time $ signum t
  fromInteger t = Time $ abs t `mod` minsPerDay
  negate (Time t) = fromInteger $ minsPerDay - t `mod` minsPerDay
-- 
minutes :: Time -> Integer
minutes (Time t) = t `mod` 60

hours :: Time -> Integer
hours (Time t) = t `div` 60

fromHourMin :: Integer -> Integer -> Time
fromHourMin h m = fromInteger (h * 60 + m)

toString :: Time -> String
toString = show