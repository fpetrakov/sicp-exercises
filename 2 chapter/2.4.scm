(define (cons x y)
	(lambda (m) (m x y)))

(define (car z)
	(z (lambda (p q) p)))

(define (cdr z) 
	(z (lambda (p q) q)))

(define my-cons (cons 1 2))

(car my-cons)
(cdr my-cons)