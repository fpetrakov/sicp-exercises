(define x (cons (list 1 2) (list 3 4))) 

(define (length items)
	(if (null? items)
			0
			(+ 1 (length (cdr items)))))

(display (length x)) (newline)

(define (count-leaves x)
	(cond ((null? x) 0)
				((not (pair? x)) 1)
				(else (+ (count-leaves (car x))
								 (count-leaves (cdr x))))))

(display (count-leaves x)) (newline)

; 2.24
(display (count-leaves (list 1 (list 2 (list 3 4))))) (newline)

; 2.25
(define first (list 1 3 (list 5 7) 9))
(display (cadr (caddr first))) (newline)

(define second (list (list 7)))
(display (caar second)) (newline)

(define third (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(display (cadr (cadr (cadr (cadr (cadr (cadr third))))))) (newline)

; 2.26
(define c (list 1 2 3))
(define d (list 4 5 6))

; (1 2 3 4 5 6)
(append c d)

; ((1 2 3) 4 5 6) 
(cons c d) 

; ((1 2 3) (4 5 6))
(list c d)

; 2.27


