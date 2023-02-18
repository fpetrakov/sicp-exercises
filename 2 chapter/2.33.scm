(define nil '())

(define (square x) (* x x))

(define (accumulate op initial sequence)
	(if (null? sequence)
			initial
			(op (car sequence)
					(accumulate op initial (cdr sequence)))))


; map
(define (map p sequence)
	(accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(display (map square (list 1 2 3))) (newline)


; append
(define (append seq1 seq2)
	(accumulate cons seq2 seq1))

(display (append (list 1 2 3) (list 4 5 6))) (newline)


; length
(define (length sequence)
	(accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(display (length (list 1 2 3))) (newline)