module SecretHandshake (handshake) where

import Data.Bits (testBit)

elements :: [(Int, String)]
elements = [ (0, "wink")
           , (1, "double blink")
           , (2, "close your eyes")
           , (3, "jump")
           ]

handshake :: Int -> [String]
handshake x = if testBit x 4 then reverse ys else ys
  where  ys = map snd $ filter (testBit x . fst) elements