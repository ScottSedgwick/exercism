package secret

const (
	wink int = 1 << iota
	doubleBlink
	closeYourEyes
	jump
	reverse
)

type handshakePart struct {
	flag    int
	message string
}

var parts = []handshakePart{
	handshakePart{wink, "wink"},
	handshakePart{doubleBlink, "double blink"},
	handshakePart{closeYourEyes, "close your eyes"},
	handshakePart{jump, "jump"},
}

func reverseArray(arr []string) []string {
	l := len(arr)
	result := make([]string, l)
	for i := range arr {
		result[l-i-1] = arr[i]
	}
	return result
}

func Handshake(code int) (result []string) {
	if code > 0 && code <= (reverse*2) {
		for _, h := range parts {
			if code&h.flag != 0 {
				result = append(result, h.message)
			}
		}
		if code&reverse != 0 {
			result = reverseArray(result)
		}
	}
	return result
}
