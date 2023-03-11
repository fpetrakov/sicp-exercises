; compares by reference -> #t
(display (eq? 'a 'a)) (newline)

(define (set-to-wow! x)
	(set-car! (car x) 'wow) 
	x)

; ((wow b) c)
(display (set-to-wow! (list (list 'a 'b) 'c))) (newline)


(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (list (list 'a 'b) 'a 'b))

; ((wow b) wow b)
(display (set-to-wow! z1)) (newline)

; ((wow b) a b)
(display (set-to-wow! z2)) (newline)


; #t
(display (eq? (car z1) (cdr z1))) (newline)

; #f
(display (eq? (car z2) (cdr z2))) (newline)