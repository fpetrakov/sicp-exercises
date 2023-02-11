(define (square x) (* x x))

(define (compose a b)
	(lambda (x) (a (b x))))

(define (repeated f n)
	(if (= n 1)
			f
			(compose f (repeated f (- n 1)))))

((repeated square 3) 5)

(define dx 0.00001)

(define (smooth f)
	(lambda (x) 
		(/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

((smooth square) 2)

(define (smooth-nth f n)
	((repeated smooth n) f))