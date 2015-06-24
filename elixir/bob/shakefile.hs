import Development.Shake
import Development.Shake.FilePath

project = "bob"

src_file = project ++ ".exs"
tst_file = project ++ "_test.exs"

main :: IO()
main = shakeArgs shakeOptions $ do
    want ["test"]
 
    "test" ~> do
        need [src_file, tst_file]
        cmd "elixir" tst_file

    "submit" ~> do
        need [src_file, "test"]
        cmd "exercism" "submit" src_file