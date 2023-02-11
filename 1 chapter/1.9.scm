(define (+ a b)
	(if (= a 0)
			b
			(inc (+ (dec a) b))))

(define (+ a b) 
	(if (= a 0)
			b
			(+ (dec a) (inc b))))

(define (inc a) + a 1)

(define (dec a) - a 1)