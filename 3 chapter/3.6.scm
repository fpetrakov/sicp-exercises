(define (rand )
	(define x random-init)

	(define (generate)
		(begin (set! x (rand-update x)) x))

	(define (reset new)
		(begin (set! x new) x))

	(define (dispatch m)
		(cond ((eq? m 'generate) generate)
					((eq? m 'reset) reset)))
	
	dispatch)
