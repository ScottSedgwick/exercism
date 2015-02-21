module Atbash (encode) where

import Data.Char (toLower)
import Data.List.Split (chunksOf)
import Data.Maybe (mapMaybe)
import qualified Data.Map as M (Map, fromList, lookup)

encode :: String -> String
encode = pad5 . mapMaybe encodeChar

pad5 :: String -> String
pad5 = unwords . chunksOf 5

cipherkey :: M.Map Char Char
cipherkey = M.fromList $ zip (['a'..'z'] ++ ['0'..'9']) (reverse ['a'..'z'] ++ ['0'..'9'])

encodeChar :: Char -> Maybe Char
encodeChar c = M.lookup (toLower c) cipherkey