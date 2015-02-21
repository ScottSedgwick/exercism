module Phone (number, areaCode, prettyPrint) where
	
import Data.Char (isDigit)
import Text.Printf (printf)
import Data.List.Split (splitPlaces)

type PhoneNumber = [String]

parseNumber :: String -> PhoneNumber
parseNumber = splitPlaces [3,3,4] . validate

fmtNumber :: String -> PhoneNumber -> String
fmtNumber f [a, p, x] = printf f a p x

validate :: String -> String
validate s | l == 10 = f
           | (l == 11) && (head f == '1') = tail f
           | otherwise = replicate 10 '0'
           where l = length f
                 f = filter isDigit s

number :: String -> String
number = fmtNumber "%s%s%s" . parseNumber

areaCode :: String -> String
areaCode = head . parseNumber

prettyPrint :: String -> String
prettyPrint = fmtNumber "(%s) %s-%s" . parseNumber