require 'fileutils'
require 'rake/clean'
require 'English'

SOLUTION_NAME = 'SumOfMultiples'
SOLUTION_DIR = File.join(File.dirname(__FILE__), SOLUTION_NAME)
SOLUTION_FILE = "#{SOLUTION_NAME}.sln"
EXERCISE_DIR  = File.join(SOLUTION_DIR, SOLUTION_NAME)
EXERCISE_FILE = 'SumOfMultiples.cs'
TESTS = File.join(EXERCISE_DIR, 'SumOfMultiplesTest.cs')
OUTPUT_FILE = 'SumOfMultiples.dll'

##########################################################################

SOLUTION = File.join(SOLUTION_DIR, SOLUTION_FILE)

EXERCISE = File.join(EXERCISE_DIR, EXERCISE_FILE)

OUTPUT_DIR  = File.join(EXERCISE_DIR, 'bin', 'Debug')
OUTPUT = File.join(OUTPUT_DIR, OUTPUT_FILE)

MSBUILD = 'C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe'
NUNIT   = File.join(SOLUTION_DIR, 'packages', 'NUnit.Runners.2.6.3', 'tools', 'nunit-console.exe')

CLOBBER.include(File.join(EXERCISE_DIR, 'bin', '**', '*'))
CLEAN.include(File.join(EXERCISE_DIR, 'obj', '**', '*'))

def puts_system(cmd)
  puts cmd
  system cmd
  fail "Child status = #{$CHILD_STATUS}" unless $CHILD_STATUS == 0
end

file OUTPUT => [SOLUTION, EXERCISE, TESTS] do
  Dir.chdir(SOLUTION_DIR) do
    puts_system "\"#{MSBUILD}\" #{SOLUTION_FILE}"
  end
end

desc "Build solution"
task build: OUTPUT

desc "Run NUnit test suite"
task test: OUTPUT do  
  Dir.chdir(OUTPUT_DIR) do
    puts_system "#{NUNIT} #{OUTPUT_FILE}"
  end
end

task default: :test

file EXERCISE_FILE => EXERCISE do
  FileUtils.cp(EXERCISE, EXERCISE_FILE, :verbose => true)
end

desc "Submit solution to Exercism.io"
task submit: [:test, EXERCISE_FILE] do
  puts_system "exercism submit #{EXERCISE_FILE}"
end
