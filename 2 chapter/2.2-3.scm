; point
(define (make-point x y) 
	(cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")")
	(newline))

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

; testing point
(define my-start (make-point 1 1))
(define my-end (make-point 3 3))
(define my-seg (make-segment my-start my-end))
(print-point (midpoint-segment my-seg))

; rectange
(define (make-rect origin-point height width angle)
  (cons (cons height width) (cons origin-point angle)))

(define (rect-height r)
	(car (car r)))

(define (rect-width r)
	(cdr (car r)))

(define (perimeter-rect r)
	(* 2 (+ (rect-width r) (rect-height r))))

(define (area-rect r)
	(* (rect-width r) (rect-height r)))

(define r1 (make-rect (make-point 1 1) 4 5 0.2))

(display "Rectangle: ") (newline)
(display "Perimeter: ") (display (perimeter-rect r1)) (newline)
(display "Area ") (display (area-rect r1)) (newline) 