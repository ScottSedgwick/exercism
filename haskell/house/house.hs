module House (rhyme) where

data Stanza = Stanza { thing :: String , that :: String }

stanzas = [
  Stanza {thing = "the house that Jack built.", that = "lay in"}
]

verse :: Stanza -> String
verse s = "that " ++ that s ++ thing s

rhyme = undefined