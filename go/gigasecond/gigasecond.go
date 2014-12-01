package gigasecond

import t "time"

const TestVersion = 1

var Birthday = t.Date(1984, t.April, 10, 24, 0, 0, 0, t.UTC)

func AddGigasecond(x t.Time) t.Time {
	return x.Add(1e9 * t.Second)
}


