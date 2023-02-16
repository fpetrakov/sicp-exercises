(define nil '())

(define (scale-tree tree factor)
	(cond ((null? tree) nil)
				((not (pair? tree)) (* tree factor))
				(else (cons (scale-tree (car tree) factor)
										(scale-tree (cdr tree) factor)))))

(define (scale-tree tree factor)
	(map (lambda (sub-tree)
					(if (pair? sub-tree)
							(scale-tree sub-tree factor)
							(* sub-tree factor)))
				tree))

(display (scale-tree (list 1 (list 2 (list 3 4) 2)) 2)) (newline)