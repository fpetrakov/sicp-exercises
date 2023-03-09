(load "./3 chapter/3.3.scm")

(define (make-joint acc old-pass new-pass)
	(define (dispatch psw m)
		(if (eq? psw new-pass)
				(lambda (x) ((acc old-pass m) x))
				(error "Wrong password")))
	
	dispatch)


(define peter-acc (make-account 100 'open-sesame))

(define paul-acc
	(make-joint peter-acc 'open-sesame 'rosebud))

(display ((paul-acc 'rosebud 'withdraw) 50)) (newline)
(display ((paul-acc 'rosebud 'withdraw) 25)) (newline)
(display ((paul-acc 'rosebud 'deposit) 1000)) (newline)
