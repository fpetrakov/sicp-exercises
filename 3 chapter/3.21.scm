(load "./3 chapter/queue.scm")

(define (print-queue q)
	(display (front-ptr q))  (newline))