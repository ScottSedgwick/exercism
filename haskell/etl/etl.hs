module ETL (transform) where

import Data.Char (toLower)
import Data.Map (Map, fromList, toList)

transform :: Map Int [String] -> Map String Int
transform = fromList . concatMap transTuple . toList 

transTuple :: (Int, [String]) -> [(String, Int)]
transTuple (i, xs) = map (\x -> (map toLower x, i)) xs