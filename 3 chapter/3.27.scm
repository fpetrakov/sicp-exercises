(define (fib n)
	(cond ((= n 0) 0)
				((= n 1) 1)
				(else (+ (fib (- n 1))
								 (fib (- n 2))))))

(define memo-fib
	(memoize (lambda (n)
							(cond ((= n 0) 0)
										((= n 1) 1)
										(else (+ (fib (- n 1))
														 (fib (- n 2))))))))

(define (memoize f)
	(let ((talbe (make-table)))
		(lambda (x)
			(let ((previously-computed-result (lookup x table)))
				(or previously-computed-result
						(let ((result (f x)))
							(insert! x result table)
							result))))))
