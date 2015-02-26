module BST (bstLeft, bstRight, bstValue, singleton, insert, fromList, toList)
where

import Data.List (foldl')

data BstNode = BstNode { bstValue :: !Int 
                       , bstLeft  :: Maybe BstNode
                       , bstRight :: Maybe BstNode 
                       } deriving (Show)

singleton :: Int -> BstNode
singleton v = BstNode v Nothing Nothing

insertL :: Int -> BstNode -> BstNode
insertL n (BstNode v Nothing  r) = BstNode v (Just (singleton n)) r
insertL n (BstNode v (Just l) r) = BstNode v (Just (insert n l) ) r

insertR :: Int -> BstNode -> BstNode
insertR n (BstNode v l Nothing ) = BstNode v l (Just (singleton n))
insertR n (BstNode v l (Just r)) = BstNode v l (Just (insert n r) )

insert :: Int -> BstNode -> BstNode
insert value node | value > bstValue node = insertR value node
                  | otherwise             = insertL value node

fromList :: [Int] -> BstNode
fromList []     = error "Cannot build BST from empty list"
fromList (x:xs) = foldl' (flip insert) (singleton x) xs

toList' :: Maybe BstNode -> [Int]
toList' Nothing = []
toList' (Just (BstNode v l r)) = toList' l ++ v : toList' r

toList :: BstNode -> [Int]
toList n = toList' (Just n)