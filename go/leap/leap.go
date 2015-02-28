package leap

const TestVersion = 1

func DivBy(value, divisor int) bool {
	return value%divisor == 0
}
func IsLeapYear(y int) bool {
	return DivBy(y, 400) || (DivBy(y, 4) && !DivBy(y, 100))
}
