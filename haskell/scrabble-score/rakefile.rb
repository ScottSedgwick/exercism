require 'English'
require 'rake/clean'

SRC = 'Scrabble.hs'
TST = 'scrabble-score_test.hs'

####################################

EXE = File.basename(TST, '.hs') + '.exe'
CLEAN.include(['*.hi', '*.o'])
CLOBBER.include(['*.exe'])

def puts_system(cmd)
	puts cmd
	system cmd
	fail "Child Status: #{$CHILD_STATUS}" unless $CHILD_STATUS == 0
end

file EXE => [SRC, TST] do
	puts_system "ghc --make #{TST}"
end

task test: EXE do
	puts_system "./#{EXE}"
end

task :ghci do
	system("ghci -Wall #{SRC}")
end

task default: :test

task submit: :test do
	puts_system "exercism submit #{SRC}"
end
