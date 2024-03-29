(define (apply procedure arguments)
  (cond ((primitive-procedure? procedure)
		 (apply-primitive-procedure procedure arguments))
		((compound-procedure? procedure)
		 (eval-sequence
		   (procedure-body procedure)
		   (extend-environement
			 (procedure-parameters procedure)
			 arguments
			 (procedure-environment procedure))))
		(else
		  (error "Unknown procedure type -- APPLY" procedure))))
