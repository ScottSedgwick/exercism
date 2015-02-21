import Development.Shake
import Development.Shake.FilePath

soln_name = "Robot"
test_file = "RobotNameTest.cs"

-- Shouldn't need to change anything below here.

soln_file = soln_name <.> "sln"
ex_file   = soln_name <.> "cs"
out_file  = soln_name <.> "dll"

ex_dir    = joinPath [soln_name, soln_name]
test_path = joinPath [ex_dir, test_file]
out_path  = joinPath [ex_dir, "bin", "Debug"]
test_dll  = joinPath [out_path, out_file]
soln      = joinPath [soln_name, soln_file]
exercise  = joinPath [ex_dir, ex_file]

quote :: String -> String
quote s = concat ["\"", s, "\""]

msbuild   = quote $ joinPath ["C:\\", "Program Files (x86)", "MSBuild", "12.0", "Bin", "MSBuild.exe"]
nunit     = joinPath [soln_name, "packages", "NUnit.Runners.2.6.3", "tools", "nunit-console.exe"]

main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test", ex_file]
 	
 	"clean" ~> do
 		removeFilesAfter "." [ex_file, test_dll]

	ex_file *> \f -> do
		need [exercise]
		copyFileChanged exercise f

	test_dll *> \_ -> do
		need [soln, exercise, test_path]
		cmd Shell msbuild soln 				-- Shell prevents haskell escaping the file path separators.

	"test" ~> do
		need [test_dll]
		cmd (Cwd out_path) nunit out_file	-- This command is run in a different directory

	"submit" ~> do
		need [ex_file, "test"]
		cmd "exercism" "submit" ex_file
