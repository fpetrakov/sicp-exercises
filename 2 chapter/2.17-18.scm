(define l (list 1 2 3 4))

; 3
(car (cdr (cdr l)))
(cadr (cdr l))

(define five (cons 5 l))

(define (list-ref items n)
	(if (= n 0)
			(car items)
			(list-ref (cdr items) (- n 1))))

; 4
(list-ref l 3)

; 5
(list-ref five 0)

(define (length items)
	(if (null? items)
			0
			(+ 1 (length (cdr items)))))

(define (length-iter items)
	(define (iter a count)
		(if (null? a)
				count
				(iter (cdr a) (+ 1 count))))
		(iter items 0))

; 5
(length five)
(length-iter five)

(define (append list1 list2)
	(if (null? list1)
			list2
			(cons (car list1) (append (cdr list1) list2))))

(define nine (append l five))

; 9
(length nine)

(define (last-pair items)
	(if (null? (cdr items))
			items
			(last-pair (cdr items))))

; (93)
(last-pair (list 23 82 82 93))

(define nil '())

(define (reverse items)
	(if (null? (cdr items))
			items
			(append (reverse (cdr items)) (cons (car items) nil))))

(reverse (list 1 2 3 4 5))
