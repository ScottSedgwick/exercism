package secret

const (
	wink int = 1 << iota
	doubleBlink
	closeYourEyes
	jump
	reverse
)

type gesture struct {
	flag    int
	message string
}

var gestures = []gesture{
	gesture{wink, "wink"},
	gesture{doubleBlink, "double blink"},
	gesture{closeYourEyes, "close your eyes"},
	gesture{jump, "jump"},
}

func reverseStrings(arr []string) []string {
	l := len(arr)
	result := make([]string, l)
	for i := range arr {
		result[l-i-1] = arr[i]
	}
	return result
}

func Handshake(code int) (result []string) {
	if code > 0 && code <= reverse*2 {
		for _, g := range gestures {
			if code&g.flag != 0 {
				result = append(result, g.message)
			}
		}
		if code&reverse != 0 {
			result = reverseStrings(result)
		}
	}
	return result
}
