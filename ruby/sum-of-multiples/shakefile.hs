import Development.Shake
import Development.Shake.FilePath

src_file = "sum.rb"
tst_file = "sum_of_multiples_test.rb"

main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test"]
 	
	"test" ~> do
		need [src_file, tst_file]
		cmd "ruby" tst_file

	"submit" ~> do
		need [src_file, "test"]
		cmd "exercism" "submit" src_file