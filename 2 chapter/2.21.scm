(define (square-list items)
	(if (null? items)
			nil
			(cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list items)
	(my-map (lambda (el) (* el el)) items))

; (1 4 9 16)
(display (square-list (list 1 2 3 4))) (newline)