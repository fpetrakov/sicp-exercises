(define nil '())

(define (my-map proc list)
	(if (null? list)
			nil
			(cons (proc (car list))
						(my-map proc (cdr list)))))

(define (scale-list list factor)
	(my-map (lambda (el) (* el factor)) list))

(display (scale-list (list 1 2 3 4 5) 10)) (newline)
(display (my-map (lambda (el) (+ el 10)) (list 1 2 3 4 5))) (newline)

; standard scheme procedure is more general
(display (map + (list 1 2 3) (list 30 40 50))) (newline)
(display (map (lambda (x y) (+ x (* 2 y))) (list 1 2 3) (list 4 5 6))) (newline)
