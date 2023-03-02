(define (=zero? n)
 	(apply-generic 'zero? n))

(put '=zero? '(scheme-number)
	(lambda (n) (= n 0)))

(put '=zero? '(rational)
	(lambda (n) (= (numerator n) 0)))

(put '=zero? '(complex)
	(lambda (n)
		(and (= (real-part n) 0)
				 (= (imag-part n) 0))))