(define (rec n)
	(
		if (< n 3)
			n
			(+ 
				(rec (- n 1)) 
				(* 2 (rec (- n 2)))
				(* 3 (rec (- n 3)))
			)
	)
)

; (define (iter n)
; 	(

; 	)
; )

(rec 3)