module Base (rebase) where

import Data.List (unfoldr)

rebase :: Integral a => a -> a -> [a] -> Maybe [a]
rebase inputBase outputBase value | inputBase < 2 || outputBase < 2 = Nothing
                                  | otherwise = fromInt outputBase $ toInt inputBase value

toInt :: Integral a => a -> [a] -> Maybe a
toInt base = foldl f (Just 0)
  where
    f Nothing  _ = Nothing
    f (Just v) x | x >= base || x < 0 = Nothing
                 | otherwise = Just $ v * base + x

fromInt :: Integral a => a -> Maybe a -> Maybe [a]
fromInt _    Nothing  = Nothing
fromInt base (Just v) = Just $ reverse $ unfoldr f v
  where
    f 0 = Nothing
    f x = Just (x `mod` base, x `div` base)
