(define (some n) (let fac ([n n])
    (if (zero? n)
        1
        (* n (fac (sub1 n))))))

(display (some 0)) (newline)
