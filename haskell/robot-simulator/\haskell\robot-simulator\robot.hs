module Robot (
  Bearing(..) 
  , Robot
  , mkRobot
  , coordinates 
  , simulate
  , bearing 
  , turnRight 
  , turnLeft
) where

import Data.List(foldl')

data Action = TurnLeft | TurnRight | Advance deriving (Show, Eq)

data Bearing = North | East | South | West deriving (Show, Eq, Bounded, Enum)

type Point = (Int, Int)

data Robot = Robot {
  bearing :: !Bearing, 
  robotX :: !Int,
  robotY :: !Int
  } deriving (Show, Eq)

mkRobot :: Bearing -> Point -> Robot
mkRobot b (x,y) = Robot { bearing = b, robotX = x, robotY = y }

coordinates :: Robot -> Point
coordinates r = (robotX r, robotY r)

predBounded :: (Enum a, Bounded a, Eq a) => a -> a
predBounded x | x == minBound = maxBound 
              | otherwise     = pred x

succBounded :: (Enum a, Bounded a, Eq a) => a -> a
succBounded x | x == maxBound = minBound 
              | otherwise     = succ x

turnRight :: Bearing -> Bearing
turnRight = succBounded

turnLeft :: Bearing -> Bearing
turnLeft = predBounded

parseAction :: Char -> Action
parseAction c | c == 'L'  = TurnLeft
              | c == 'R'  = TurnRight
              | c == 'A'  = Advance
              | otherwise = error ("Error parsing invalid action " ++ [c]) 

advance :: Bearing -> Point -> Point
advance North (x, y) = (x,     y + 1)
advance East  (x, y) = (x + 1, y)
advance South (x, y) = (x,     y - 1)
advance West  (x, y) = (x - 1, y)

act' :: Bearing -> Point -> Action -> Robot
act' b c TurnLeft  = mkRobot (turnLeft b) c
act' b c TurnRight = mkRobot (turnRight b) c
act' b c Advance   = mkRobot b (advance b c)

act :: Robot -> Action -> Robot
act r = act' (bearing r) (coordinates r)

simulate :: Robot -> String -> Robot
simulate robot = foldl' act robot . map parseAction