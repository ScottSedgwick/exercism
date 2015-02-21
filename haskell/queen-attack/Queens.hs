module Queens (boardString, canAttack) where

import Prelude hiding (replicate)
import Data.List (intercalate)
import Data.Sequence (Seq, replicate, update, index)
import Data.Foldable (toList)

data Colour = Black | White | Empty deriving (Eq)
instance Show Colour where
	show Black  = "B"
	show White  = "W"
	show Empty  = "_"

type Position = (Int, Int)

type Row = Seq Colour

type Board = Seq Row

emptyBoard :: Board
emptyBoard = replicate 8 (replicate 8 Empty)

showRow :: Row -> String
showRow = unwords . map show . toList

showBoard :: Board -> String
showBoard b = intercalate "\n" rows ++ "\n"
            where rows = map showRow $ toList b

placePiece :: Maybe Position -> Colour -> Board -> Board
placePiece Nothing       _ b = b
placePiece (Just (x, y)) c b = update x newRow b
                             where newRow = update y c oldRow
                                   oldRow = index b x

boardString :: Maybe Position -> Maybe Position -> String
boardString whitePos blackPos = showBoard finalBoard
                              where finalBoard = placePiece whitePos White blackBoard
                                    blackBoard = placePiece blackPos Black emptyBoard

canAttack :: Position -> Position -> Bool
canAttack (x1, y1) (x2, y2) = x1 == x2 || y1 == y2 || dx == dy
                            where dx = abs (x1 - x2)
                                  dy = abs (y1 - y2)