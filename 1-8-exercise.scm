(define (abs x)
  (if (>= x 0) x (- x)))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (average x y)
  (/ (+ (* x 2) y) 3))


(define (improve guess x)
  (average guess (/ x (* guess guess))))

(define (cube-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-iter (improve guess x) x)))

(define (cube x)
  (cube-iter 1.0 x))
