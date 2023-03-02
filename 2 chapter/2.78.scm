; Tags
(define (attach-tag type-tag contents)
	(cond [(eq? type-tag 'scheme-number) contents]
				[else (cons type-tag contents)]))

(define (type-tag datum)
	(cond [(number? datum) 'scheme-number]
				[(pair? datum) (car datum)]
				[else (error "Некорректные помеченные данные -- TYPE-TAG" datum)]))

(define (contents datum)
	(cond [(number? datum)]
				[(pair? datum) (cdr datum)]
				[error ("Некорректные помеченные данные -- CONTENT-TAG" datum)]))