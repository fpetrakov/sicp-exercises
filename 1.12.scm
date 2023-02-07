(define (fn row col)
  (cond ((= row 1) 1)
        ((or (= col 1) (= col row)) 1)
        (else (+ (fn (- row 1)  (- col 1))
                 (fn (- row 1) col)))))

(define res (fn 10 5))

(display res)