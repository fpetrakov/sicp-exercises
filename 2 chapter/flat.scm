(define nil '())

(define (flat seq)
	(accumulate append nil seq))

(define l (list (list 1 2 3) (list 4 5 6)))

(display (flat l)) (newline)