import Development.Shake
import Development.Shake.FilePath

src_file = "rna_transcription.rb"
tst_file = "rna_transcription_test.rb"

rubocop = ".rubocop.rb"

main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test"]

	rubocop %> \out -> writeFile' out 
		("require 'rubygems'\n" ++
		 "version = '>= 0'\n" ++
		 "gem 'rubocop', version\n" ++
		 "load Gem.bin_path('rubocop', 'rubocop', version)\n")

	"check_style" ~> do
		need [src_file, rubocop]
		cmd "ruby" rubocop src_file
 	
	"test" ~> do
		need [src_file, tst_file, "check_style"]
		cmd "ruby" tst_file

	"submit" ~> do
		need [src_file, "test"]
		cmd "exercism" "submit" src_file