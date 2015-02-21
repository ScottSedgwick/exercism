module School (add, empty, grade, sorted, School) where

import Data.Map (assocs, findWithDefault, insertWith, Map)
import qualified Data.Map as M (empty)
import Data.List (sort)
import Control.Arrow (second)

type School = Map Int [String]

add :: Int -> String -> School -> School
add g n = insertWith (++) g [n]

empty :: School
empty = M.empty

grade :: Int -> School -> [String]
grade = findWithDefault []

sorted :: School -> [(Int, [String])]
sorted = map (second sort) . assocs