import Development.Shake
import Development.Shake.FilePath
import System.Info

srcFile = "raindrops.go"

main :: IO()
main = shakeArgs shakeOptions $ do
	want ["test"]

	"fmt" ~> cmd "go" "fmt"

	"test" ~> do
		need ["fmt"]
		cmd "go" "test"

	"submit" ~> do
		need ["test"]
		cmd "exercism" "submit" srcFile

	"fetch" ~> 
		cmd "exercism" "fetch" "go"