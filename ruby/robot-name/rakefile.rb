require 'English'
require 'rake/clean'

SRC = 'robot.rb'
TST = 'robot_name_test.rb'

####################################

def puts_system(cmd)
	puts cmd
	system cmd
	fail "Child Status: #{$CHILD_STATUS}" unless $CHILD_STATUS == 0
end

task test: [TST, SRC] do
	puts_system "ruby #{TST}"
end

task default: :test

task submit: :test do
	puts_system "exercism submit #{SRC}"
end
