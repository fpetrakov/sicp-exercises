(load "./3 chapter/logical-gates.scm")

(define (or-gate a1 a2 output)
	(define (or-action-procedure)
		(let ((new-value
						(logical-or (get-signal a1))))
			(after-delay or-gate-delay
										(lambda ()
											(set-signal! output new-value)))))
	(add-action! a1 or-action-procedure)
	(add-action! a1 or-action-procedure)
	'ok)

(define (logic-or s1 s2)
	(if (or (= s1 1) (= s2 1))
				1
				0))