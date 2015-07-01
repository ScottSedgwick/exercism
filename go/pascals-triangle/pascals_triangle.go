package pascal

func next_row(r []int) []int {
	l := len(r)
	result := make([]int, l+1)
	result[0] = 1
	result[l] = 1
	for i := 1; i < l; i++ {
		result[i] = r[i-1] + r[i]
	}
	return result
}

func Triangle(n int) [][]int {
	result := make([][]int, n)
	result[0] = next_row([]int{})
	for i := 1; i < n; i++ {
		result[i] = next_row(result[i-1])
	}
	return result
}
