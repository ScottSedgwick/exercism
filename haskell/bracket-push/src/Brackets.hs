module Brackets (arePaired) where

data Brackets = Brace | Bracket | Parentheses | Other deriving (Eq, Show)
data BracketDir = NotBracket | OpenBracket | CloseBracket deriving (Eq, Show)

btype :: Char -> Brackets
btype c | c `elem` "{}" = Brace
        | c `elem` "[]" = Bracket
        | c `elem` "()" = Parentheses
        | otherwise     = Other

bdir :: Char -> BracketDir
bdir c | c `elem` "{[(" = OpenBracket
       | c `elem` "}])" = CloseBracket
       | otherwise      = NotBracket

arePaired :: String -> Bool
arePaired = matchBrackets [] 

matchBrackets :: [Brackets] -> String -> Bool
matchBrackets [] []     = True
matchBrackets _  []     = False
matchBrackets bs (c:cs) = 
    case bdir c of
        NotBracket   -> matchBrackets bs cs
        OpenBracket  -> matchBrackets (btype c : bs) cs
        CloseBracket -> not (null bs || head bs /= btype c) && matchBrackets (tail bs) cs
