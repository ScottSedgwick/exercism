package raindrops

import (
	"fmt"
	"sort"
)

var sounds = map[int]string{
	3: "Pling",
	5: "Plang",
	7: "Plong",
}

func Convert(value int) string {
	var keys []int
	for k := range sounds {
		keys = append(keys, k)
	}
	sort.Ints(keys)
	result := ""
	for _, k := range keys {
		if value%k == 0 {
			result += sounds[k]
		}
	}
	if result == "" {
		result = fmt.Sprintf("%d", value)
	}
	return result
}
