(define (exchange acc1 acc2)
	(let ((difference (- (acc1 'balance)
											 (acc2 'balance))))
		((acc1 'withdraw) difference)
		((acc2 'deposit) difference)))


(define (make-account balance)
	(define (withdraw amount)
		(if (>= balance amount)
				(begin (set! balance (- balance amount))
							 balance)
				"Not enough money on the account"))
	
	(define (deposit amount)
		(set! balance (+ balance amount))
		balance)

	(let ((balance-serializer (make-serializer)))
		(define (dispatch m)
			(cond ((eq? m 'withdraw) withdraw)
						((eq? m 'deposit) deposit)
						((eq? m 'balance) balance)
						((eq? m 'serializer) balance-serializer)
						(else (error "Unknown operation -- MAKE-ACCOUNT" m))))
		dispatch))


(define (deposit account amount)
	(let ((s (account 'serializer))
				(d (account 'deposit)))
		((s d) amount)))


(define (serialized-exchange acc1 acc2)
	(let ((ser1 (acc1 'serializer))
			  (ser2 (acc2 'serializer)))
		((ser1 (ser2 exhange))
		acc1
		acc2)))