module School (add, empty, grade, sorted, School) where

import Data.Map (assocs, findWithDefault, insertWith, Map)
import qualified Data.Map as M (empty)
import Data.List (sort)

type School = Map Int [String]

add :: Int -> String -> School -> School
add grade name = insertWith (++) grade [name]

empty :: School
empty = M.empty

grade :: Int -> School -> [String]
grade = findWithDefault []

sorted :: School -> [(Int, [String])]
sorted = map (\(g, ns) -> (g, sort ns)) . assocs