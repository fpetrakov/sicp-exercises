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
  (if (or (<= (lower-bound y) 0) (<= (upper-bound y) 0)) 
      (error "Division error (interval spans 0)" y) 
      (mul-interval x  
                    (make-interval (/ 1 (upper-bound y)) 
                                   (/ 1 (lower-bound y)))))) 

(define (width-interval a)
	(- (upper-bound a) (lower-bound a)))

(define int1 (make-interval 0 100))
(define int2 (make-interval 22 23))

(display "int1= ") 
(display (width-interval int1)) (newline)
(display "int2= ") 
(display (width-interval int2)) (newline)
(display "mul= ")
(display (width-interval (mul-interval int1 int2))) (newline)
(display "div= ")
(display (width-interval (div-interval int1 int2))) (newline)
(display "new div= ")
(display (div-interval int1 int2))