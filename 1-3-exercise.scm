(define (square x) (* x x))

(define (squareSum x y) 
  (+ (square x) (square y))
)

(define (sumOfLargestTwoSquared x y z)
  (cond ((and (> x z) (> y z)) (squareSum x y))
        ((and (> y x) (> z x)) (squareSum y z))
        (else (squareSum x z))
  )
) 