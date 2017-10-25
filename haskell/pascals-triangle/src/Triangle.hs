module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x | x < 1  = []
       | x == 1 = [[1]]
       | x == 2 = [[1], [1, 1]]
       | otherwise = rs ++ [nextRow (last rs)]
  where
    rs = rows (x - 1)
    nextRow xs = concat [[1], map (\(a,b) -> a + b) (zip xs (tail xs)), [1]]