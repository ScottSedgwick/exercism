package gigasecond

import (
	"time"
)

const TestVersion = 2
const gigasecond = 1e9 * time.Second

var Birthday = time.Date(1968, time.September, 23, 0, 0, 0, 0, time.Local)

func AddGigasecond(t time.Time) time.Time {
	return t.Add(gigasecond)
}
