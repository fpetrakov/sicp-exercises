; project
(define (project x)
	(let ((proc (get 'project (type-tag x))))
		(if proc
				(proc (contents x))
				#f)))

(put 'project 'complex
		 (lambda (x) (attach-tag 'real (real-part x))))

(put 'project 'scheme-number
		 (lambda (x) (make-rational (round r) 1)))
	
(put 'project 'rational
		 	(lambda (r) 
				(attach-tag 'scheme-number (round (/ (numer q) (denom q))))))


; drop
(define (drop x)
	(let ((projected (project x))
		(if (and (projected (equ? x (raise projected))))
				(drop projected)
				x))))
