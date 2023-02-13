; point
(define (make-point x y) 
	(cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

; segment
(define (make-segment	start end) 
	(cons start end))

(define (start-segment segment)
	(car segment))

(define (end-segment segment)
	(cdr segment))

; midpoint-segment
(define (midpoint-segment segment)
	(make-point 
		(/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
		(/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2)))

(define (print-point p)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")")
	(newline))

(define my-start (make-point 1 1))
(define my-end (make-point 3 3))
(define my-seg (make-segment my-start my-end))
(print-point (midpoint-segment my-seg))
