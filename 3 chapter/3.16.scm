(load "./3 chapter/3.13.scm")

(define (count-pairs x)
	(if (not (pair? x))
	  	0
			(+ (count-pairs (car x))
				 (count-pairs (cdr x))
				 1)))

(define x (list 'a 'b 'c))
(define z1 (cons x x))
(define z2 (list (list 'a 'b) 'a ))

; 3
(display (count-pairs x)) (newline)

; 7
(display (count-pairs z1)) (newline)

; 4
(display (count-pairs z2)) (newline)

; infinite loop
(display (count-pairs (make-cycle (list 'a 'b 'c)))) (newline)