(load "./3 chapter/3.12.scm")

(define (make-cycle x)
	(set-cdr! (last-pair x) x)
	x)

(define z (make-cycle (list 'a 'b 'c)))

; infinite loop
; (display z) (newline)