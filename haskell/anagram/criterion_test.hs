import Criterion.Main
import GHC.IO.Encoding
import Anagram (anagramsFor)

-- Our benchmark harness.
main = do
  setLocaleEncoding utf8
  setFileSystemEncoding utf8
  setForeignEncoding utf8
  defaultMain [
      bench "allergy" $ whnf (anagramsFor "allergy") ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]
    ]