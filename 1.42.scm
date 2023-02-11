(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (compose a b)
	(lambda (x) (a (b x))))

((compose square inc) 6)