(define (element-of-set? x set)
	(cond ((null? set) #f)
				((equal? x (car set)) #t)
				(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
	(if (element-of-set? x set)
			set
			(cons x set)))

(define (intersection-set set1 set2)
	(cond ((or (null? set1) (null? set2)) '())
				((element-of-set? (car set1) set2)
				 (cons (car set1)
				 			 (intersection-set (cdr set1) set2)))
				(else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
	(cond ((and (null? set1) (not (null? set2))) set2)
				((and (null? set2) (not (null? set1))) set1)
				((element-of-set? (car set1) set2) 
					(union-set (cdr set1) set2))
				(else (cons (car set1) (union-set (cdr set1) set2)))))

(display (union-set '(0 2 4 5 6 0) '(2 5 7 0 10))) (newline)
