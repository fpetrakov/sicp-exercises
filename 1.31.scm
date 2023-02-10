(define (inc n) (+ n 1))

(define (identity x) x)

(define (product term a next b)
	(if (> a b)
	1
	(* (term a)
		 (product term (next a) next b))))

(define (factorial n)
	(product identity 1 inc n))

(factorial 5)
