(load "./3 chapter/3.13.scm")

(define (has-cycle? x)
	(define seen '())
	
	(define (iter rest)
		(if (not (pair? rest)) 
				#f
				(if (memq rest seen) 
						#t
						(begin
							(set! seen (cons rest seen))
							(or (iter (car rest))
								  (iter (cdr rest)))))))

	(iter x))


; #t
(display (has-cycle? (make-cycle (list 'a 'b 'c)))) (newline)

; #f
(display (has-cycle? (list 'a 'b 'c))) (newline)

; #f
(display (has-cycle? (list 'a 'b 'c 'a))) (newline)