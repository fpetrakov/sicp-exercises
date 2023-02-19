(define nil '())

(define (accumulate op initial sequence)
	(if (null? sequence)
			initial
			(op (car sequence)
					(accumulate op initial (cdr sequence)))))

(define (fold-left op initial sequence)
	(define (iter result rest)
		(if (null? rest)
				result
				(iter (op result (car rest))
							(cdr rest))))
	(iter initial sequence))

(display (accumulate / 2 (list 1 2 3))) (newline)
(display (fold-left / 2 (list 1 2 3))) (newline)
(display (accumulate list nil (list 1 2 3))) (newline)
(display (fold-left list nil (list 1 2 3))) (newline)

; op should not depend on the order of args