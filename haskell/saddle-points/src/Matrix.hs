module Matrix (saddlePoints) where

import Data.Array (Array, (!), assocs, bounds)

isSaddlePoint :: Array (Int,Int) Int -> (Int,Int) -> Bool
isSaddlePoint a (r,c) = v == maximum row && v == minimum col
  where
    ((lr, lc), (hr, hc)) = bounds a
    row = [a!(r, i) | i <- [lr..hr]]
    col = [a!(i, c) | i <- [lc..hc]]
    v = a!(r, c)

saddlePoints :: Array (Int,Int) Int -> [(Int,Int)]
saddlePoints matrix = filter (isSaddlePoint matrix) $ map fst $ assocs matrix
