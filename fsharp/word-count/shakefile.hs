import Development.Shake (CmdOption (..), (~>), (*>), cmd, copyFileChanged, need, removeFilesAfter, shakeArgs, shakeOptions, want)
import System.FilePath ((<.>), joinPath)
import qualified Data.Text as T

soln_name = "word-count"
src_file  = "Phrase.fs"
tst_file  = "WordCountTests.fs"

-- Shouldn't need to change anything below here.
src_dir   = joinPath [soln_name]
test_file = joinPath [src_dir, tst_file]
dll_file  = (T.unpack (T.replace (T.pack "-") (T.pack "_") (T.pack soln_name))) <.> "dll"
dll_path  = joinPath [src_dir, "bin", "Debug"]
dll_full  = joinPath [dll_path, dll_file]
soln_full = joinPath [soln_name <.> "sln"]
exercise  = joinPath [src_dir, src_file]
msbuild   = show $ joinPath ["C:\\", "Program Files (x86)", "MSBuild", "12.0", "Bin", "MSBuild.exe"]
nunit     = joinPath ["C:\\", "dev", "exercism", "fsharp", soln_name, "packages", "NUnit.Runners.2.6.4", "tools", "nunit-console.exe"]

main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test", src_file]
 	
 	"clean" ~> do
 		removeFilesAfter "." [src_file]
 		removeFilesAfter src_dir ["obj//*", "bin//*"]

	src_file *> \f -> do
		need [exercise]
		copyFileChanged exercise f

	dll_full *> \_ -> do
		need [soln_full, exercise, test_file]
		cmd Shell msbuild soln_full 		-- Shell prevents haskell escaping the file path separators.

	"test" ~> do
		need [dll_full]
		cmd (Cwd dll_path) nunit dll_file	-- This command is run in a different directory

	"submit" ~> do
		need [src_file, "test"]
		cmd "exercism" "submit" src_file