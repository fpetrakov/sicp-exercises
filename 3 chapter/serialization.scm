(define x 10)

; this one can have 5 ways to order the computing of x
; 101, 121, 110, 11, 100
(parallel-execute (lambda () (set! x (* x x)))
									(lambda () (set! x (+ x 1))))


; this one can have only 2 ways to order the computing of x
; 101, 121
; serialization creates a set of procedures that can't be
; executed at the same time, only one after the other
(define s (make-serializer))
(parallel-execute (s (lambda () (set! x (* x x))))
									(s (lambda () (set! x (+ x 1)))))

				
; serialized make-acccount from chapter 3.1.1
(define (make-account balance)
	(define (withdraw amount)
		(if (>= balance amount)
				(begin (set! balance (- balance amount))
							 balance)
				"Not enough money on the account"))
	
	(define (deposit amount)
		(set! balance (+ balance amount))
		balance)

	(let ((protected (make-serializer)))
		(define (dispatch m)
			(cond ((eq? m 'withdraw) (protected withdraw))
						((eq? m 'deposit) (protected deposit))
						((eq? m 'balance) balance)
						(else (error "Unknown operation -- MAKE-ACCOUNT" m))))
		dispatch))