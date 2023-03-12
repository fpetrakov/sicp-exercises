(define (make-queue)
	(define q (cons '() '()))
	
	(define (front-ptr) (car q))

	(define (rear-ptr) (cdr q))
	
	(define (set-front-ptr! item) (set-car! q item))

	(define (set-rear-ptr! item) (set-cdr! q item))

	(define (empty-queue?) (null? (front-ptr)))

	(define (front-queue)
		(if (empty-queue?)
				(error "FRONT is called with empty queue" q)
				(car (front-ptr))))

	(define (insert-queue! item)
		(let ((new-pair (cons item '())))
			(cond ((empty-queue?)
						(set-front-ptr! new-pair)
						(set-rear-ptr! new-pair)
						q)
						(else
						(set-cdr! (rear-ptr) new-pair)
						(set-rear-ptr! new-pair)
						q))))

	(define (delete-queue!)
		(cond ((empty-queue?)
					(error "DELETE! is called with empty queue" q))
					(else
					(set-front-ptr! (cdr (front-ptr q)))
					q)))

	(define (print-queue)
		(display (front-ptr)) (newline))
	
	(define (dispatch m)
		(cond ((eq? m 'empty?) (empty-queue?))
					((eq? m 'front) (front-queue))
					((eq? m 'insert!) insert-queue!)
					((eq? m 'delete!) delete-queue!)
					((eq? m 'print) (print-queue))
					(else (error "Unknown operation -- MAKE-QUEUE" m))))
	
	dispatch)


(define qu (make-queue))
((qu 'insert!) 5)
((qu 'insert!) 4)
(qu 'print)
