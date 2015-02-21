module Garden (garden, defaultGarden, lookupPlants, Plant(..)) where

import Data.List (sort, transpose)
import Data.Maybe(fromJust, isJust)

data Plant = Grass | Clover | Radishes | Violets deriving (Show, Eq)

type Child = String

type PlantStr = String

type Garden = [(Child, [Plant])]

defaultChildren :: [Child]
defaultChildren = ["Alice", "Bob", "Charlie", "David", 
                   "Eve", "Fred", "Ginny", "Harriet", 
                   "Ileana", "Joseph", "Kincaid", "Larry"]

garden :: [Child] -> PlantStr -> Garden
garden cs ps = zip (sort cs) (parsePlants ps)

defaultGarden :: PlantStr -> Garden
defaultGarden = garden defaultChildren

lookupPlants :: Child -> Garden -> [Plant]
lookupPlants c g = fromMaybe [] res
	             where res = lookup c g

concatPlants :: [[Plant]] -> [[Plant]]
concatPlants (a:b:ps) = (a ++ b) : concatPlants ps
concatPlants _ = []

swapElems :: [Plant] -> [Plant]
swapElems (x:y:z:xs) = x:z:y:xs
swapElems xs = xs

parsePlants :: PlantStr -> [[Plant]]
parsePlants = map swapElems . concatPlants . transpose . map (map parsePlant) . lines

parsePlant :: Char -> Plant
parsePlant 'G' = Grass
parsePlant 'C' = Clover
parsePlant 'R' = Radishes
parsePlant 'V' = Violets
parsePlant  _  = undefined