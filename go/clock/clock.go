package clock

import (
	"fmt"
)

const TestVersion = 2

type Clock struct {
	Hours   int
	Minutes int
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.Hours, c.Minutes)
}

func (c Clock) Add(mins int) Clock {
	return Time(c.Hours, c.Minutes+mins)
}

func Time(h int, m int) Clock {
	h += m / 60
	m %= 60
	if m < 0 {
		h -= 1
		m += 60
	}
	h %= 24
	if h < 0 {
		h += 24
	}
	return Clock{Hours: h, Minutes: m}
}
