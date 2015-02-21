module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral | Isosceles | Scalene | Illogical deriving (Show, Eq)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c | a + b <= c || a + c <= b || b + c <= a = Illogical
                   | a == b && b == c                       = Equilateral
                   | a == b || b == c || a == c             = Isosceles
                   | otherwise                              = Scalene