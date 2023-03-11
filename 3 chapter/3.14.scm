(define (reverse-list x)
	(define (loop x y)
		(if (null? x)
				y
				(let ((temp (cdr x)))
					(set-cdr! x y)
					(loop temp x))))
	(loop x '()))


(define v (list 'a 'b 'c 'd))

(define w (reverse-list v))


; (d c b a)
(display w) (newline)

; (a)
(display v) (newline)