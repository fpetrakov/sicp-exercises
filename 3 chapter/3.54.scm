(load "./3 chapter/section-3.5.2.scm")
(load "./3 chapter/stream-take.scm")

(define (mul-streams s1 s2)
	(stream-map * s1 s2))

(define factorials (cons-stream 1 (mul-streams factorials 
																							 (stream-cdr integers))))

(display-stream (stream-take factorials 8))