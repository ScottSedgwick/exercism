package raindrops

import (
	"fmt"
)

var sounds = map[int]string{
	3: "Pling",
	5: "Plang",
	7: "Plong",
}

func Convert(value int) string {
	result := ""
	for k, v := range sounds {
		if value%k == 0 {
			result += v
		}
	}
	if result == "" {
		result = fmt.Sprintf("%d", value)
	}
	return result
}
