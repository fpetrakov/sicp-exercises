(load "./3 chapter/section-3.5.2.scm")
(load "./3 chapter/stream-take.scm")

(define (merge s1 s2)
	(cond ((stream-null? s1) s2)
				((stream-null? s2) s1)
				(else
					(let ((s1car (stream-car s1))
							 	(s2car (stream-car s2)))
						(cond ((< s1car s2car)
									 (cons-stream s1car (merge (stream-cdr s1) s2)))
									((< s2car s1car)
									 (cons-stream s2car (merge (stream-cdr s2) s1)))
									(else
										(cons-stream s1car
																	(merge (stream-cdr s1)
																				 (stream-cdr s2)))))))))
																				
(define S 
	(cons-stream 1
							 (merge (merge (scale-stream S 2) 
														 (scale-stream S 3)) 
                      (scale-stream S 5))))

(display-stream (stream-take S 100))
