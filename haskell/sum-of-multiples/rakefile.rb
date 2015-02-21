require 'English'
require 'rake/clean'

SRC = 'SumOfMultiples.hs'
TST = 'sum-of-multiples_test.hs'
EXE = 'sum-of-multiples_test.exe'

####################################

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

task default: :test

task submit: :test do
	puts_system "exercism submit #{SRC}"
end
