package leap

const TestVersion = 1

func isDivBy(value, divisor int) bool {
	return value%divisor == 0
}
func IsLeapYear(y int) bool {
	return isDivBy(y, 400) || (isDivBy(y, 4) && !isDivBy(y, 100))
}