(load "./3 chapter/3.13.scm")

(define (has-cycle? x)
	(define slow x)
	(define fast (cdr x))
	
	(define (iter)
		(if (eq? slow fast)
				#t
				(if (or (null? fast) (null? (cdr fast)))
						#f
						(begin (set! slow (cdr slow))
							 (set! fast (cddr fast))
							 (iter)))))

	(iter))


; #t
(display (has-cycle? (make-cycle (list 'a 'b 'c)))) (newline)

; #f
(display (has-cycle? (list 'a 'b 'c))) (newline)

; #f
(display (has-cycle? (list 'a 'b 'c 'a))) (newline)