import Development.Shake
import Development.Shake.FilePath
import System.Info

problem = "minesweeper"

srcFile = problem ++ ".hs"
tstFile = problem ++ "_test.hs"
exeFile | os == "darwin" = replaceExtension tstFile ""
        | otherwise      = replaceExtension tstFile "exe"

exeCmd  | os == "darwin" = "./" ++ exeFile
        | otherwise      = exeFile

tmpFile = srcFile ++ ".tmp"

hindent :: String -> Action(String)
hindent s = do
	Stdout out <- command [Stdin s] "hindent" ["--style", "gibiansky"]
	return out

diffHIndent :: FilePath -> Action()
diffHIndent f = do
	s <- readFile' f
	tmp <- hindent s
	checkDiff f s tmp

checkDiff :: FilePath -> String -> String -> Action()
checkDiff f s tmp | s == tmp  = putQuiet "No HIndent changes required"
                  | otherwise = diff f tmp

diff :: FilePath -> String -> Action()
diff f tmp = do
  writeFile' tmpFile tmp
  Exit _ <- command [] "BCompare.exe" [tmpFile, f]
  removeFilesAfter "." [tmpFile]



main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test"]
 	
 	"clean" ~> 
 		removeFilesAfter "." ["*.o", "*.hi", exeFile]

	exeFile *> \_ -> do
		need [srcFile, tstFile]
		cmd "ghc" "--make" "-Wall" tstFile

	"lint" ~> do
		need [srcFile]
		cmd "hlint" srcFile

	"diff" ~> do
		diffHIndent srcFile

	"checkIndent" ~> do
		need ["lint"]
		tmp <- hindent srcFile
		src <- readFile' srcFile
		if (src == tmp)
			then putQuiet "No suggestions"
			else diffHIndent srcFile


	"test" ~> do
		need [exeFile, "lint", "checkIndent"]
		cmd exeCmd

	"submit" ~> do
		need [srcFile, "test"]
		cmd "exercism" "submit" srcFile

	"fetch" ~> 
		cmd "exercism" "fetch"