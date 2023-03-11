(load "./3 chapter/3.13.scm")

; (define (count-pairs x)
; 	(if (not (pair? x))
; 	  	0
; 			(+ (count-pairs (car x))
; 				 (count-pairs (cdr x))
; 				 1)))

(define (count-pairs x)
	(define seen '())
	
	(define (iter rest)
		(if (or (not (pair? rest)) (memq rest seen))
				0
				(begin
					(set! seen (cons rest seen))
					(+ (iter (car rest))
						 (iter (cdr rest))
						 1))))

	(iter x))


(define x (list 'a 'b 'c))
(define z1 (cons x x))
(define z2 (list (list 'a 'b) 'a ))

; 3
(display (count-pairs x)) (newline)

; 4	
(display (count-pairs z1)) (newline)

; 3
(display (count-pairs (make-cycle (list 'a 'b 'c)))) (newline)
