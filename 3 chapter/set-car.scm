(define x (list (list 'a 'b) 'c 'd))
(define y (list 'e 'f))

; ((a b) c d)
(display x) (newline)
; (e f)
(display y) (newline)


(set-car! x y)
; ((e f) c d)
(display x) (newline)


(set-cdr! x y)
; ((e f) e f)
(display x) (newline)


; cons
(define (cons x y)
	(let ((new (get-new-pair)))
		(set-car! new x)
		(set-cdr! new y)
		new))