(load "./3 chapter/section-3.5.2.scm")
(load "./3 chapter/stream-take.scm")

(define (partial-sums s)
	(add-streams s (cons-stream 0 (partial-sums s))))

; 1 3 6 10 15 21 28 36
(define sums (partial-sums integers))
(display-stream (stream-take sums 8))