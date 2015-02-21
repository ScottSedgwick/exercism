module LinkedList (new, isNil, nil, datum, next, toList, fromList, reverseLinkedList) where

data List a = EmptyList | ListElement a (List a) 
	deriving (Show)

nil :: List a
nil = EmptyList

isNil :: List a -> Bool
isNil EmptyList = True
isNil _         = False

new :: a -> List a -> List a
new = ListElement

datum :: List a -> a
datum EmptyList = undefined
datum (ListElement x _) = x

next :: List a -> List a
next EmptyList = undefined
next (ListElement _ xs) = xs

fromList :: [a] -> List a
fromList = foldr new EmptyList

foldrList :: (a -> b -> b) -> b -> List a -> b
foldrList _ z EmptyList = z
foldrList f z (ListElement x xs) = x `f` foldrList f z xs

foldlList :: (b -> a -> b) -> b -> List a -> b
foldlList _ z EmptyList = z
foldlList f z (ListElement x xs) = let z' = z `f` x
                                in seq z' $ foldlList f z' xs  

toList :: List a -> [a]
toList = foldrList (:) []

reverseLinkedList :: List a -> List a
reverseLinkedList = foldlList (flip new) EmptyList