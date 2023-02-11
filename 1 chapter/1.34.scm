(define (f g)
	(g 2))

(f (lambda (x) (* x x)))

(f (lambda (z) (* z (+ z 1))))

; will throw error
(f f)