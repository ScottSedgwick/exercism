import Development.Shake
import Development.Shake.FilePath
import System.Info

src_file = "word_count.clj"
tst_file = "word_count_test.clj"

exe_file | os == "darwin" = replaceExtension tst_file ""
         | otherwise      = replaceExtension tst_file "exe"

exe_cmd  | os == "darwin" = "./" ++ exe_file
         | otherwise      = exe_file

main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test"]

	"test" ~> do
		need [src_file, tst_file]
		cmd "lein" "test"

	"submit" ~> do
		need ["test"]
		cmd "exercism" "submit" src_file

	"fetch" ~> do
		cmd "exercism" "fetch"