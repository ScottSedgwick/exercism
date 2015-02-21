require 'English'
require 'rake/clean'

CLEAN.include(['*.hi', '*.o'])
CLOBBER.include(['*.exe'])

file 'leap_test.exe' => ['LeapYear.hs', 'leap_test.hs'] do
	cmd = "ghc --make leap_test"
	puts cmd
	system cmd
	fail 'Compilation failure' unless $CHILD_STATUS == 0
end

task test: 'leap_test.exe' do
	cmd = './leap_test.exe'
	puts cmd
	system cmd
	fail 'Unit test failure' unless $CHILD_STATUS == 0
end

task default: :test
