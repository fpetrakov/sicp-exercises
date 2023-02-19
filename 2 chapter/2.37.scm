(define nil '())

(define (accumulate op initial sequence)
	(if (null? sequence)
			initial
			(op (car sequence)
					(accumulate op initial (cdr sequence)))))

(define (accumulate-n op initial seqs)
	(if (null? (car seqs))
			nil	
			(cons (accumulate op initial (map car seqs))
						(accumulate-n op initial (map cdr seqs)))))

(define matrix (list (list 1 2 3) (list 2 2 2) (list 1 5 9)))


(define (dot-product v w)
	(accumulate + 0 (map * v w)))

(display (dot-product (list 1 2 3) (list 2 2 2))) (newline)


(define (matrix-*-vector m v)
	(map (lambda (m-row) (dot-product m-row v)) m))

(display (matrix-*-vector matrix (list 2 2 2))) (newline)


; (define (transpose mat)
; 	(accumulate-n () () mat))