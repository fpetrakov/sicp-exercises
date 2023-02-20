(define nil '())


(define (accumulate op initial sequence)
	(if (null? sequence)
			initial
			(op (car sequence)
					(accumulate op initial (cdr sequence)))))


(define (enumerate-interval low high)
	(if (> low high)
			nil
			(cons low (enumerate-interval (+ low 1) high))))


(define (flatmap proc seq)
	(accumulate append nil (map proc seq)))


; prime?
(define (square x) (* x x))

(define (divides? a b)
	(= (remainder b a) 0))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
				((divides? test-divisor n) test-divisor)
				(else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
	(find-divisor n 2))

(define (prime? n)
	(= n (smallest-divisor n)))
; end


(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (filter predicate sequence)
	(cond ((null? sequence) nil)
				((predicate (car sequence))
				 (cons (car sequence)
				 			 (filter predicate (cdr sequence))))
				(else (filter predicate (cdr sequence)))))


(define (prime-sum-pairs n)
	(map make-pair-sum
				(filter prime-sum?
								(flatmap
									(lambda (i)
										(map (lambda (j) (list i j))
												 (enumerate-interval 1 (- i 1))))
									(enumerate-interval 1 n)))))

(display (prime-sum-pairs 6)) (newline)


; permutations
(define (remove item sequence)
	(filter (lambda (x) (not (= x item))) sequence))

(define (permutations s)
	(if (null? s)
			(list nil)
			(flatmap (lambda (x)
									(map (lambda (p) (cons x p))
												(permutations (remove x s)))) 
							s)))

(display (permutations (list 1 2 3))) (newline)