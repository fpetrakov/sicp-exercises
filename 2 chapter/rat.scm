; linear-combination for integers
(define (linear-combination a b x y)
	(+ (* a x) (* b y)))

; general linear-combination
(define (linear-combination a b x y)
	(add (mul a x) (mul b y)))

(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))

(car (car z))
(car (cdr z))

(define (gcb a b)
	(if (= b 0)
			a
			(gcb b (remainder a b))))

; make-rat is a constructor
(define (make-rat n d)
	(let ((g (gcb n d))
				(denom-sign (if (> d 0) 1 (- 1))))
		(cons (* (/ n g) denom-sign) 
					(* (/ d g) denom-sign))))

; numer and denom are selectors
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y))
							 (* (numer y) (denom x)))
						(* (denom x) (denom y))))

(define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y))
							 (* (numer y) (denom x)))
						(* (denom x) (denom y))))

(define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
						(* (denom x) (denom y))))

(define (div-rat x y)
	(make-rat (* (numer x) (denom y))
						(* (denom x) (numer y))))

(define (equal-rat? x y)
	(= (* (numer x) (denom y))
		 (* (numer y) (denom x))))

(define (print-rat x)
	(display (numer x))
	(display "/")
	(display (denom x))
	(newline))

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(print-rat (add-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
(print-rat (add-rat one-third one-third))
