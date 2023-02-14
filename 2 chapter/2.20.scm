(define nil '())

(define (reverse items)
	(if (null? (cdr items))
			items
			(append (reverse (cdr items)) (cons (car items) nil))))

(define (even? n)
	(= (remainder n 2) 0))
	
(define (odd? n)
	(not (even? n)))

(define (same-parity first . rest)
	(let ((good? (if (even? first) even? odd?)))
		(define (iter items result)
			(if (null? items)
					(reverse result)
					(iter (cdr items) (if (good? (car items))
																(cons (car items) result)
																result))))
	(iter rest (list first))))

(same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)
(same-parity 2 3 4 5 6 7)
; (2 4 6)
