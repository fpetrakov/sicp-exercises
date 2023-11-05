(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
		(esle (eval (first-exp exps) env)
			  (eval-sequence (rest-exps exps) env))))
