import Test.HUnit (Assertion, (@=?), runTestTT, Test(..), Counts(..))
import System.Exit (ExitCode(..), exitWith)
import qualified ListOps as L

exitProperly :: IO Counts -> IO ()
exitProperly m = do
  counts <- m
  exitWith $ if failures counts /= 0 || errors counts /= 0 then ExitFailure 1 else ExitSuccess

testCase :: String -> Assertion -> Test
testCase label assertion = TestLabel label (TestCase assertion)

main :: IO ()
main = exitProperly $ runTestTT $ TestList
       [ TestList listOpsTests ]

big :: Int
big = 100000

listOpsTests :: [Test]
listOpsTests =
  [ testCase "length of empty list" $
    0 @=? L.length ([] :: [Int])
  , testCase "length of non-empty list" $
    4 @=? L.length [1 .. 4 :: Int]
  , testCase "length of large list" $
    big @=? L.length [1 .. big :: Int]
  , testCase "reverse of empty list" $
    [] @=? L.reverse ([] :: [Int])
  , testCase "reverse of non-empty list" $
    [100 , 99 .. 1] @=? L.reverse [1 .. 100 :: Int]
  , testCase "map of empty list" $
    [] @=? L.map (+1) ([] :: [Int])
  , testCase "map of non-empty list" $
    [2, 4 .. 8] @=? L.map (+1) [1, 3 .. 7 :: Int]
  , testCase "filter of empty list" $
    [] @=? L.filter undefined ([] :: [Int])
  , testCase "filter of normal list" $
    [1, 3] @=? L.filter odd [1 .. 4 :: Int]
  , testCase "foldl' of empty list" $
    0 @=? L.foldl' (+) (0 :: Int) []
  , testCase "foldl' of non-empty list" $
    7 @=? L.foldl' (+) (-3) [1 .. 4 :: Int]
  , testCase "foldl' of huge list" $
    big * (big + 1) `div` 2 @=? L.foldl' (+) 0 [1 .. big]
  , testCase "foldl' with non-commutative function" $
    0 @=? L.foldl' (-) 10 [1 .. 4 :: Int]
  , testCase "foldr as id" $
    [1 .. big] @=? L.foldr (:) [] [1 .. big]
  , testCase "foldr as append" $
    [1 .. big] @=? L.foldr (:) [100 .. big] [1 .. 99]
  , testCase "++ of empty lists" $
    [] @=? [] L.++ ([] :: [Int])
  , testCase "++ of empty and non-empty lists" $
    [1 .. 4] @=? [] L.++ [1 .. 4 :: Int]
  , testCase "++ of non-empty and empty lists" $
    [1 .. 4] @=? [1 .. 4 :: Int] L.++ []
  , testCase "++ of non-empty lists" $
    [1 .. 5] @=? [1 .. 3] L.++ [4, 5 :: Int]
  , testCase "++ of large lists" $
    [1 .. big] @=? [1 .. big `div` 2] L.++ [1 + big `div` 2 .. big]
  , testCase "concat of no lists" $
    [] @=? L.concat ([] :: [[Int]])
  , testCase "concat of list of lists" $
    [1 .. 6] @=? L.concat [[1, 2], [3], [], [4, 5, 6 :: Int]]
  , testCase "concat of large list of small lists" $ 
    [1 .. big] @=? L.concat (map (:[]) [1 .. big])
  ]
