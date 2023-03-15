(load "./3 chapter/logical-gates.scm")

(define (ripple-carry-adder a-list b-list sum-list c-out-list)
	(let ((c-in-list (map (lambda (x) (make-wire)) (cdr a-list)))
				(c-0 (make-wire)))
		(map
			full-adder
			a-list
			b-list
			(append c-in-list (list c-0))
			sum-list
			(cons c-out-list c-in-list))
	'ok))
