package raindrops

import (
	"fmt"
)

type RainSound struct {
	factor int
	sound  string
}

var sounds = []RainSound{
	RainSound{3, "Pling"},
	RainSound{5, "Plang"},
	RainSound{7, "Plong"},
}

func Convert(value int) string {
	result := ""
	for _, s := range sounds {
		if value%s.factor == 0 {
			result += s.sound
		}
	}
	if result == "" {
		result = fmt.Sprintf("%d", value)
	}
	return result
}
