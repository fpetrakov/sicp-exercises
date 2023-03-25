(load "./3 chapter/section-3.5.2.scm")
(load "./3 chapter/stream-take.scm")

(define s (cons-stream 1 (add-streams s s)))

(display-stream (stream-take s 8))