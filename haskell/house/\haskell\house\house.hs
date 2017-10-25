module House (rhyme) where

import           Data.List (tails)

things :: [(String, String)]
things =
  [ ("horse and the hound and the horn", "belonged to")
  , ("farmer sowing his corn", "kept")
  , ("rooster that crowed in the morn", "woke")
  , ("priest all shaven and shorn", "married")
  , ("man all tattered and torn", "kissed")
  , ("maiden all forlorn", "milked")
  , ("cow with the crumpled horn", "tossed")
  , ("dog", "worried")
  , ("cat", "killed")
  , ("rat", "ate")
  , ("malt", "lay in")
  ]

start :: String
start = "This is"

middles :: [String]
middles = map (\(t1, t2) -> concat ["the ", t1, "\nthat ", t2]) things

finish :: String
finish = "the house that Jack built.\n"

verses :: [[String]]
verses = map (\middle -> concat [[start], middle, [finish]]) $ reverse $ tails middles

rhyme :: String
rhyme = unlines $ map unwords verses