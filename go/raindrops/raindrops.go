package raindrops

import "fmt"

func Convert(i int) string {
	vals := GetPrimes(i)
	if len(vals) <= 0 {
		return "hah"
	} else {

	}
}

func GetPrimes(num int) []int {
	primes := []int{3,5,7}
	var results []int

	for i := range primes {
		if num % i == 0 {
			results = append(results, i)
		}
	}
	return results
}
