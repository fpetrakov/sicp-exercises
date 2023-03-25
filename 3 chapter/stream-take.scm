(define (stream-take s n)
	(if (= n 0)
			the-empty-stream
			(cons-stream (stream-car s)
									 (stream-take (stream-cdr s) (- n 1)))))