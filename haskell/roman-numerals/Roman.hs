module Roman (numerals) where

import Data.List(filter)
import Safe(headDef)

type Numeral = (Int, String)

allNumerals :: [Numeral]
allNumerals = [
	  	(1000, "M"),
	  	(900,  "CM"),
	  	(500,  "D"),
	  	(400,  "CD"),
	  	(100,  "C"),
	  	(90,   "XC"),
	  	(50,   "L"),
	  	(40,   "XL"),
	  	(10,   "X"),
	  	(9,    "IX"),
	  	(5,    "V"),
	  	(4,    "IV"),
	  	(1,    "I")
	]

getLargestNumeral :: Int -> Numeral
getLargestNumeral value = headDef (0, "") $ filter (\(v,c) -> value >= v) allNumerals

intToNumerals :: Int -> [Numeral]
intToNumerals value | value <= 0 = []
	            | otherwise  = numeral : intToNumerals (value - fst numeral)
				where numeral = getLargestNumeral value

numeralsToString :: [Numeral] -> String
numeralsToString = concatMap snd

numerals :: Int -> String
numerals = numeralsToString . intToNumerals