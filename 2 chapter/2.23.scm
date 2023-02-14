(define nil '())

(define (for-each proc list)
	(if (null? list)
			nil
			(and (proc (car list))
				(for-each proc (cdr list)))))

(for-each (lambda (x) (display x) (newline)) (list 2 4 8))