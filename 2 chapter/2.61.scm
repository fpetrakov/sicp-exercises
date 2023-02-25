(define (element-of-set? x set)
	(cond ((null? set) #f)
				((= x (car set)) #t)
				((< x (car set)) #f)
				(else (element-of-set? x (cdr set)))))


(define (intersetion-set  set1 set2)
	(if (or (null? set1) (null? set2))
			'()
			(let ((x1 (car set1)) (x2 (car set2)))
				(cond ((= x1 x2)
							 (cons x1
							 			 (intersection-set (cdr set1)
										 									 (cdr set2))))
							((< x1 x2)
							 (intersection-set (cdr set1) set2))
							((< x2 x1)
							 (intersection-set (cdr set2) set1))))))

; 2.61
(define (adjoin-set x set)
		(cond ((null? set) (list x))
					((= x (car set)) set)
					((< x (car set)) (cons x set))
					(else (cons (car set) (adjoin-set x (cdr set))))))
	
(display (adjoin-set 10 '(1 2 3 4 5 6 7 8 9))) (newline)
(display (adjoin-set 5 '(1 2 3 4 6 7 8 9))) (newline)
(display (adjoin-set 4 '(1 2 3 4 6 7 8 9))) (newline)

; 2.62
(define nil '())

(define (filter predicate sequence)
	(cond ((null? sequence) nil)
				((predicate (car sequence))
				 (cons (car sequence)
				 			 (filter predicate (cdr sequence))))
				(else (filter predicate (cdr sequence)))))

(define (union-set set1 set2)
	(append (filter 
						(lambda (x) (not( element-of-set? x set2))) 
						set1) 
					set2))

(display (union-set (list 1 2 3 4 5) (list 3 4 5 6 7))) (newline)
