(define (append! x y)
	(set-cdr! (last-pair x) y)
	x)

(define (last-pair x)
	(if (null? (cdr x))
			x
			(last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))

;; (a b c d)
(define z (append x y)) 

; (b)
(display (cdr x)) (newline)

; (a b c d)
(define w (append! x y))

; (b c d)
(display (cdr x)) (newline)