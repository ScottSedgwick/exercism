require 'English'

SRC = 'series.py'
TST = 'series_test.py'

####################################

def puts_system(cmd)
	puts cmd
	system cmd
	fail "WAT? CHILD_STATUS = #{$CHILD_STATUS}" unless $CHILD_STATUS == 0
end

task test: [SRC, TST] do
	puts_system "python3 #{TST}"
end

task default: :test

task submit: :test do
	puts_system "exercism submit #{SRC}"
end