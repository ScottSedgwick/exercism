import Development.Shake
import Development.Shake.FilePath
import System.Info

srcFile = "CryptoSquare.hs"
tstFile = "crypto-square_test.hs"

exeFile | os == "darwin" = replaceExtension tstFile ""
         | otherwise      = replaceExtension tstFile "exe"

exeCmd  | os == "darwin" = "./" ++ exeFile
         | otherwise      = exeFile

main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test"]
 	
 	"clean" ~> 
 		removeFilesAfter "." ["*.o", "*.hi", exeFile]

	exeFile *> \_ -> do
		need [srcFile, tstFile]
		cmd "ghc" "--make" "-Wall" tstFile

	"test" ~> do
		need [exe_file]
		cmd exeCmd

	"submit" ~> do
		need [srcFile, "test"]
		cmd "exercism" "submit" srcFile

	"fetch" ~> 
		cmd "exercism" "fetch"