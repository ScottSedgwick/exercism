import Development.Shake
import Development.Shake.FilePath

srcFile = "Binary.hs"
tstFile = "binary_test.hs"

exeFile = replaceExtension tstFile "exe"

main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test"]
 	
 	"clean" ~>
 		removeFilesAfter "." ["*.o", "*.hi", "*.exe"]

	exeFile *> \_ -> do
		need [srcFile, tstFile]
		cmd "ghc" "--make" tstFile

	"test" ~> do
		need [exeFile]
		cmd exeFile

	"submit" ~> do
		need [srcFile, "test"]
		cmd "exercism" "submit" srcFile