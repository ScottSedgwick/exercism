module Robot (robotName, mkRobot, resetName) where

import System.Random(randomRIO)
import Data.Functor((<$>))
import Control.Concurrent.STM(TVar, atomically, newTVar, readTVar, writeTVar)

data Robot = Robot { name :: TVar String }

mkRobot :: IO Robot
mkRobot = Robot <$> (newName >>= atomically . newTVar)

robotName :: Robot -> IO String
robotName = atomically . readTVar . name

resetName :: Robot -> IO()
resetName robot = newName >>= atomically . writeTVar(name robot)

newName :: IO String
newName = mapM randomRIO [char, char, num, num, num]
        where char = ('A', 'Z')
              num  = ('0', '9')