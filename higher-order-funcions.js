const summation = (n, term) => {
	let total = 0
	let k = 1

	while (k <= n) {
		total = total + term(k)
		k = k + 1
	}

	return total
}
const cube = x => x * x * x
const sumCubes = n => summation(n, cube)
