(define nil '())

(define (fringe x)
	(cond ((null? x) nil)
				((pair? (car x))
					(append (fringe (car x)) (fringe (cdr x))))
				(else x)))

(define x (list (list 1 2) (list 3 4)))
(display (fringe x)) (newline)
(display (fringe (list (list x) x x))) (newline)