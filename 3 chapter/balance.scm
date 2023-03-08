(define balance 100)

(define (withdraw amount)
	(if (>= balance amount)
			; begin вычисляет выражения последовательно
			(begin (set! balance (- balance amount))
						 balance)
			"Недостаточно средств на счете"))


; now balance is encapsulated
; the hiding principle helps us to make system more modular
; by hiding parts of system from modules that don't need these parts
(define new-withdraw
	(let ((balance 100))
		(lambda (amount)
			(if (>= balance amount)
					(begin (set! balance (- balance amount))
								 balance)
					"Недостаточно денег на счете"))))


(define (make-withdraw balance)
	(lambda (amount)
		(if (>= balance amount)
				(begin (set! balance (- balance amount))
							 balance)
				"Not enough money")))

(define object1 (make-withdraw 100))
(define new-object (make-withdraw 100))
; (display (object1 50)) (newline)
; (display (new-object 25)) (newline)


(define (make-account balance)
	(define (withdraw amount)
		(if (>= balance amount)
				; begin вычисляет выражения последовательно
				(begin (set! balance (- balance amount))
							balance)
				"Недостаточно средств на счете"))
				
	(define (deposit amount)
		(begin (set! balance (+ balance amount))
					 balance))
					 
	(define (dispatch m)
		(cond ((eq? m 'withdraw) withdraw)
					((eq? m 'deposit) deposit)
					(else (error "Unknown call -- MAKE-ACCOUNT" m))))
					
	dispatch)

(define acc (make-account 100))
; (display ((acc 'withdraw) 10)) (newline)
; (display ((acc 'deposit) 100)) (newline)