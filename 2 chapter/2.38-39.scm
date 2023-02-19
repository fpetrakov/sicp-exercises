(define nil '())

(define (accumulate op initial sequence)
	(if (null? sequence)
			initial
			(op (car sequence)
					(accumulate op initial (cdr sequence)))))

(define (fold-left op initial sequence)
	(define (iter result rest)
		(if (null? rest)
				result
				(iter (op result (car rest))
							(cdr rest))))
	(iter initial sequence))

(display (accumulate / 2 (list 1 2 3))) (newline)
(display (fold-left / 2 (list 1 2 3))) (newline)
(display (accumulate list nil (list 1 2 3))) (newline)
(display (fold-left list nil (list 1 2 3))) (newline)
(newline)

; op should not depend on the order of args


; 2.39
(define (reverse-right sequence)
	(accumulate (lambda (x y) (append y (cons x nil))) nil sequence))

(define (reverse-left sequence)
	(fold-left (lambda (x y) (cons y x)) nil sequence))

(display (reverse-right (list 1 2 3))) (newline)
(display (reverse-left (list 1 2 3))) (newline)
