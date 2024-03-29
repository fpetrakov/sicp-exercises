(define (iterative-improve good-enough? improve)
	(define (try guess) 
		(let ((next (improve guess)))
			(if (good-enough? guess next)
					next
					(try next))))
	(lambda (first-guess) (try first-guess)))

; fixed-point
(define tolerance 0.00001)

(define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
	((iterative-improve close-enough? f) first-guess))

(fixed-point cos 1.0)

; sqrt
(define (average x y)
	(/ (+ x y) 2))

(define (sqrt x)
	(fixed-point (lambda (y) (average y (/ x y)))
							1.0))

(sqrt 2)
