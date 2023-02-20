(define (unique-pairs n)
	(flatmap (lambda (i)
					(map (lambda (j) (list i j))
							 (enumerate-interval 1 (- i 1))))
				(enumerate-interval 1 n)))

; ((1 2))
(display (unique-pairs 2)) (newline)

; ((1 2) (1 3) (2 3))
(display (unique-pairs 3)) (newline)