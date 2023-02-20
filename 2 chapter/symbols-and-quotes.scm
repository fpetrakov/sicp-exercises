(define a 1)
(define b 2)

(define (quote a) (define a))

; с любым выражением можно обращаться как с объектом данных	

; same shit
; (define l (list (quote a) (quote b))) 
(define l (list  'a 'b'))

(display l) (newline)

; a
(display (car '(a b c))) (newline)
; (b c)
(display (cdr '(a b c))) (newline)

(define nil '())

; #f
; checks equality by reference 
(display (eq? '(a) '(a))) (newline)


; memq
(define (memq item seq)
 	(cond ((null? seq) #f)
				((eq? item (car seq)) seq)
				(else (memq item (cdr seq)))))

; (2 5)
(display (memq 2 (list 1 3 2 5))) (newline)
