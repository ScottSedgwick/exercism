package triangle

import (
	"math"
	"sort"
)

type Kind int

const (
	Equ Kind = iota
	Iso
	Sca
	NaT
)

func isInvalid(v float64) bool {
	return math.IsNaN(v) || math.IsInf(v, 0)
}

func KindFromSides(a float64, b float64, c float64) Kind {
	s := []float64{a, b, c}

	for _, v := range s {
		if isInvalid(v) {
			return NaT
		}
	}

	sort.Float64s(s)

	if s[0]+s[1] <= s[2] {
		return NaT
	} else if (s[0] == s[1]) && (s[1] == s[2]) {
		return Equ
	} else if (s[0] == s[1]) || (s[1] == s[2]) {
		return Iso
	} else {
		return Sca
	}
}