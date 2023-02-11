(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (compose a b)
	(lambda (x) (a (b x))))

(define (repeated f n)
	(if (= n 1)
			f
			(compose f (repeated f (- n 1)))))

((repeated square 3) 5)