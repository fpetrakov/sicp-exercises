(define (make-account balance password)
	(define failed-count 0)

	(define (increase-failed-count) 
		(begin (set! failed-count (+ failed-count 1)) "Wrong password!"))

	(define (call-the-police) (error "Police is here!"))

	(define (withdraw amount)
		(if (>= balance amount)
				(begin (set! balance (- balance amount))
							balance)
				"Недостаточно средств на счете"))
				
	(define (deposit amount)
		(begin (set! balance (+ balance amount))
					 balance))
					 
	(define (dispatch psw m)
		(if (eq? psw password)
				(begin
					(set! count 0)
					(cond ((eq? m 'withdraw) withdraw)
							((eq? m 'deposit) deposit)
							(else (error "Unknown call -- MAKE-ACCOUNT" m))))
				(lambda (s) (if (> failed-count 7)
						(call-the-police)
						(increase-failed-count)))))
					
	dispatch)


(define acc (make-account 100 'pass))
(display ((acc 'pass 'withdraw) 10)) (newline)
(display ((acc 'some 'withdraw) 90)) (newline)
(display ((acc 'pass 'deposit) 100)) (newline)
(display ((acc 'some 'withdraw) 90)) (newline)
(display ((acc 'some 'withdraw) 90)) (newline)
(display ((acc 'some 'withdraw) 90)) (newline)
(display ((acc 'some 'withdraw) 90)) (newline)
(display ((acc 'some 'withdraw) 90)) (newline)
(display ((acc 'some 'withdraw) 90)) (newline)
(display ((acc 'some 'withdraw) 90)) (newline)
(display ((acc 'some 'withdraw) 90)) (newline)