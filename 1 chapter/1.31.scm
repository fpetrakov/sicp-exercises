(define (inc n) (+ n 1))

(define (identity x) x)

(define (product-rec term a next b)
	(if (> a b)
	1
	(* (term a)
		 (product-rec term (next a) next b))))

(define (factorial-rec n)
	(product-rec identity 1 inc n))

(factorial-rec 5)

(define (product-iter term a next b)
	(define (iter a result)
		(if (> a b)
				result
				(iter (next a) (* result (term a)))))
	(iter a 1))

(define (factorial-iter n)
	(product-iter identity 1 inc n))


(factorial-iter 5)