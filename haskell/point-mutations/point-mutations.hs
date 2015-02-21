module DNA
where
	hammingDistance :: String -> String -> Int
	hammingDistance = ((length . filter id) .) . zipWith (/=)
	
	-- hammingDistance as bs = length $ filter id $ zipWith (/=) as bs