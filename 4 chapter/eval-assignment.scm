(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
					   (eval (assigmnment-value exp) env)
					   env)
  'ok)