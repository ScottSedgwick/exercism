require 'fileutils'
require 'rake/clean'

ROOT_DIR = File.dirname(__FILE__)

SOLUTION_DIR = ROOT_DIR
SOLUTION_FILE = 'bank-account.sln'
SOLUTION = File.join(SOLUTION_DIR, SOLUTION_FILE)

EXERCISE_DIR  = File.join(SOLUTION_DIR, 'bank-account')
EXERCISE_FILE = 'BankAccount.fs'
EXERCISE = File.join(EXERCISE_DIR, EXERCISE_FILE)
TESTS = File.join(EXERCISE_DIR, 'BankAccountTest.fs')

OUTPUT_DIR  = File.join(EXERCISE_DIR, 'bin', 'Debug')
OUTPUT_FILE = 'bank_account.dll'
OUTPUT = File.join(OUTPUT_DIR, OUTPUT_FILE)

MSBUILD = 'C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe'
NUNIT   = File.join(SOLUTION_DIR, 'packages', 'NUnit.Runners.2.6.3', 'tools', 'nunit-console.exe')

CLOBBER.include(File.join(EXERCISE_DIR, 'bin', '**', '*'))
CLEAN.include(File.join(EXERCISE_DIR, 'obj', '**', '*'))

file OUTPUT => [SOLUTION, EXERCISE, TESTS] do
  Dir.chdir(SOLUTION_DIR) do
    system("\"#{MSBUILD}\" #{SOLUTION_FILE}")
  end
end

desc "Build solution"
task build: OUTPUT

desc "Run NUnit test suite"
task test: OUTPUT do  
  Dir.chdir(OUTPUT_DIR) do
    cmd = "#{NUNIT} #{OUTPUT_FILE}"
    puts cmd
    system cmd
  end
end

task default: :test

file EXERCISE_FILE => EXERCISE do
  FileUtils.cp(EXERCISE, EXERCISE_FILE, :verbose => true)
end

desc "Submit solution to Exercism.io"
task submit: EXERCISE_FILE do
  system("exercism submit #{EXERCISE_FILE}")
end
