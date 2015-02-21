import Test.HUnit (Assertion, (@=?), runTestTT, Test(..), Counts(..))
import System.Exit (ExitCode(..), exitWith)
import Bob (responseFor)

exitProperly :: IO Counts -> IO ()
exitProperly m = do
  counts <- m
  exitWith $ if failures counts /= 0 || errors counts /= 0 then ExitFailure 1 else ExitSuccess

testCase :: String -> Assertion -> Test
testCase label assertion = TestLabel label (TestCase assertion)

testRespondsToSomething :: Assertion
testRespondsToSomething =
  "Whatever." @=? responseFor "Tom-ay-to, tom-aaaah-to."

testRespondsToShouts :: Assertion
testRespondsToShouts =
  "Whoa, chill out!" @=? responseFor "WATCH OUT!"

testRespondsToQuestions :: Assertion
testRespondsToQuestions =
  "Sure." @=? responseFor "Does this cryogenic chamber make me look fat?"

testRespondsToForcefulTalking :: Assertion
testRespondsToForcefulTalking =
  "Whatever." @=? responseFor "Let's go make out behind the gym!"

testRespondsToAcronyms :: Assertion
testRespondsToAcronyms =
  "Whatever." @=? responseFor "It's OK if you don't want to go to the DMV."

testRespondsToForcefulQuestions :: Assertion
testRespondsToForcefulQuestions =
  "Whoa, chill out!" @=? responseFor "WHAT THE HELL WERE YOU THINKING?"

testRespondsToShoutingWithSpecialCharacters :: Assertion
testRespondsToShoutingWithSpecialCharacters =
  "Whoa, chill out!" @=? responseFor 
    "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"

testRespondsToShoutingNumbers :: Assertion
testRespondsToShoutingNumbers =
  "Whoa, chill out!" @=? responseFor "1, 2, 3 GO!"

testRespondsToShoutingWithNoExclamationMark :: Assertion
testRespondsToShoutingWithNoExclamationMark =
  "Whoa, chill out!" @=? responseFor "I HATE YOU"

testRespondsToStatementContainingQuestionMark :: Assertion
testRespondsToStatementContainingQuestionMark =
  "Whatever." @=? responseFor "Ending with ? means a question."

testRespondsToSilence :: Assertion
testRespondsToSilence =
  "Fine. Be that way!" @=? responseFor ""

testRespondsToProlongedSilence :: Assertion
testRespondsToProlongedSilence =
  "Fine. Be that way!" @=? responseFor "    "

testRespondsToNonLettersWithQuestion :: Assertion
testRespondsToNonLettersWithQuestion =
  "Sure." @=? responseFor ":) ?"

testRespondsToMultipleLineQuestions :: Assertion
testRespondsToMultipleLineQuestions =
  "Whatever." @=? responseFor "\nDoes this cryogenic chamber make me look fat? \nno"

testRespondsToOtherWhitespace :: Assertion
testRespondsToOtherWhitespace =
  "Fine. Be that way!" @=? responseFor "\n\r \t\v\xA0\x2002" -- \xA0 No-break space, \x2002 En space

testRespondsToOnlyNumbers :: Assertion
testRespondsToOnlyNumbers =
  "Whatever." @=? responseFor "1, 2, 3"

testRespondsToQuestionWithOnlyNumbers :: Assertion
testRespondsToQuestionWithOnlyNumbers =
  "Sure." @=? responseFor "4?"

testRespondsToUnicodeShout :: Assertion
testRespondsToUnicodeShout =
  "Whoa, chill out!" @=? responseFor "\xdcML\xc4\xdcTS!"

testRespondsToUnicodeNonShout :: Assertion
testRespondsToUnicodeNonShout =
  "Whatever." @=? responseFor "\xdcML\xe4\xdcTS!"

respondsToTests :: [Test]
respondsToTests =
  [ testCase "something" testRespondsToSomething
  , testCase "shouts" testRespondsToShouts
  , testCase "questions" testRespondsToQuestions
  , testCase "forceful talking" testRespondsToForcefulTalking
  , testCase "acronyms" testRespondsToAcronyms
  , testCase "forceful questions" testRespondsToForcefulQuestions
  , testCase "shouting with special characters"
    testRespondsToShoutingWithSpecialCharacters
  , testCase "shouting numbers" testRespondsToShoutingNumbers
  , testCase "shouting with no exclamation mark"
    testRespondsToShoutingWithNoExclamationMark
  , testCase "statement containing question mark"
    testRespondsToStatementContainingQuestionMark
  , testCase "silence" testRespondsToSilence
  , testCase "prolonged silence" testRespondsToProlongedSilence
  , testCase "questioned nonsense" testRespondsToNonLettersWithQuestion
  , testCase "multiple-line statement containing question mark"
    testRespondsToMultipleLineQuestions
  , testCase "all whitespace is silence" testRespondsToOtherWhitespace
  , testCase "only numbers" testRespondsToOnlyNumbers
  , testCase "question with only numbers" testRespondsToQuestionWithOnlyNumbers
  , testCase "unicode shout" testRespondsToUnicodeShout
  , testCase "unicode non-shout" testRespondsToUnicodeNonShout
  ]

main :: IO ()
main = exitProperly (runTestTT (TestList respondsToTests))
