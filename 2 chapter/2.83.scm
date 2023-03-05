(define (raise x) (apply-generic 'raise x))

(put 'raise 'scheme-number
		 (lambda (x) (make-rational x 1)))
	
(put 'raise 'rational
		 (lambda (x) (attach-tag 'real (/ (numer x) (denom x)))))
	
(put 'raise 'real
		 (lambda (r) (make-complex-from-real-imag r 0)))
	