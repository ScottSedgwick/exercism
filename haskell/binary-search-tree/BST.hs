module BST (
    bstLeft,
    bstRight,
    bstValue,
    singleton,
    insert,
    fromList,
    toList,
    ) where

import           Data.List (foldl')

data BstNode a = BstNode { bstValue :: !a
                         , bstLeft :: Maybe (BstNode a)
                         , bstRight :: Maybe (BstNode a)
                         }

singleton :: a -> BstNode a
singleton v = BstNode v Nothing Nothing

insertL :: Ord a => a -> BstNode a -> BstNode a
insertL n (BstNode v Nothing r) = BstNode v (Just (singleton n)) r
insertL n (BstNode v (Just l) r) = BstNode v (Just (insert n l)) r

insertR :: Ord a => a -> BstNode a -> BstNode a
insertR n (BstNode v l Nothing) = BstNode v l (Just (singleton n))
insertR n (BstNode v l (Just r)) = BstNode v l (Just (insert n r))

insert :: Ord a => a -> BstNode a -> BstNode a
insert value node
  | value > bstValue node = insertR value node
  | otherwise = insertL value node

fromList :: Ord a => [a] -> BstNode a
fromList [] = error "Cannot build BST from empty list"
fromList (x:xs) = foldl' (flip insert) (singleton x) xs

toList' :: Maybe (BstNode a) -> [a]
toList' Nothing = []
toList' (Just (BstNode v l r)) = toList' l ++ v : toList' r

toList :: BstNode a -> [a]
toList n = toList' (Just n)