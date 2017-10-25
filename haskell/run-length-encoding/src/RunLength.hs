module RunLength (decode, encode) where

import Data.List(group)
import Data.Char(isDigit)

decode :: String -> String
decode [] = []
decode xs = replicate l c ++ decode ys
  where 
    ls   = takeWhile isDigit xs
    l    = if ls == [] then 1 else (read ls :: Int)
    c:ys = drop (length ls) xs

encode :: String -> String
encode = concat . map deflate . group

deflate :: String -> String
deflate ss = if l < 2 then s else show l ++ s
  where
    s = take 1 ss
    l = length ss
