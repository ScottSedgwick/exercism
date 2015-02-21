require 'English'

FILE = 'complement.rb'
TEST = 'complement_test.rb'

def puts_system(cmd)
  puts cmd
  system cmd
  fail "Child status: #{$CHILD_STATUS}" unless $CHILD_STATUS == 0
end

task test: [FILE, TEST] do 
  puts_system "ruby #{TEST}"
end

task default: :test

task submit: :test do
  puts_system "exercism submit #{FILE}"
end