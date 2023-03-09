(define (make-account balance password)
	(define (withdraw amount)
		(if (>= balance amount)
				; begin вычисляет выражения последовательно
				(begin (set! balance (- balance amount))
							balance)
				"Недостаточно средств на счете"))
				
	(define (deposit amount)
		(begin (set! balance (+ balance amount))
					 balance))
					 
	(define (dispatch psw m)
		(if (eq? psw password)
				(cond ((eq? m 'withdraw) withdraw)
							((eq? m 'deposit) deposit)
							(else (error "Unknown call -- MAKE-ACCOUNT" m)))
				(error "Wrong password")))
					
	dispatch)


; (define acc (make-account 100 'pass))
; (display ((acc 'pass 'withdraw) 10)) (newline)
; (display ((acc 'some 'withdraw) 90)) (newline)
; (display ((acc 'pass 'deposit) 100)) (newline)