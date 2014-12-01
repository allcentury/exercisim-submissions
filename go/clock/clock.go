package clock

import "fmt"

const TestVersion = 1

type Clock struct {
	hour, minute int
}

func New(hour, minute int) Clock {
	baseHour := hour % 24
	minutesPerHour := baseHour * 60
	minutesIn24Hours := 1440

	totalMinutes := minutesPerHour + minutesIn24Hours + minute

	newHour := (totalMinutes / 60 ) % 24
	newMinute := totalMinutes % 60

	return Clock{newHour, newMinute}
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hour, c.minute)
}

func (c Clock) Add(m int) Clock {
	return New(c.hour, c.minute+m)
}
