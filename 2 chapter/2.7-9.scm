(define (make-interval a b) (cons a b))

(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
								 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
	(make-interval (- (lower-bound x) (upper-bound y))
								 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
	(let ((p1 (* (lower-bound x) (lower-bound y)))
				(p2 (* (lower-bound x) (upper-bound y)))
				(p3 (* (upper-bound x) (lower-bound y)))
				(p4 (* (upper-bound x) (upper-bound y))))
			(make-interval (min p1 p2 p3 p4)
										 (max p1 p2 p3 p4))))

(define (div-interval x y)
	(mul-interval x
								(make-interval (/ 1.0 (upper-bound y))
															 (/ 1.0 (lower-bound y)))))

(define (width-interval a)
	(- (upper-bound a) (lower-bound a)))

(define int1 (make-interval 100.0 101.0))
(define int2 (make-interval 22.0 23.0))

(display "int1= ") 
(display (width-interval int1)) (newline)
(display "int2= ") 
(display (width-interval int2)) (newline)
(display "mul= ")
(display (width-interval (mul-interval int1 int2))) (newline)
(display "div= ")
(display (width-interval (div-interval int1 int2))) (newline)