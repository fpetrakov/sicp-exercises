(define (make-monitored proc)
	(define count 0)

	(define (reset-count)
		(begin (set! count 0)))

	(define (increase-count)
		(begin (set! count (+ count 1))))

	(define (dispatch m)
		(cond ((eq? m 'how-many-calls?) count)
					((eq? m 'reset-count) reset-count)
					(else (and (increase-count) (proc m)))))

dispatch)

(define s (make-monitored sqrt))
(display (s 10000)) (newline) 
(display (s 10000)) (newline) 
(display (s 10000)) (newline) 
(display (s 'how-many-calls?)) (newline)