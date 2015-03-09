import Development.Shake
import Development.Shake.FilePath

src_file = "prime_factors.py"
tst_file = "prime_factors_test.py"

main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test"]
 	
	"test" ~> do
		need [src_file, tst_file]
		cmd "python3" tst_file
		-- puts_system "python3 #{TST}"

	"submit" ~> do
		need [src_file, "test"]
		cmd "exercism" "submit" src_file