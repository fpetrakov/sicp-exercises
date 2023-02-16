(define (make-mobile left right)
	(cons left right))

(define (left-branch mobile)
	(car mobile))

(define (right-branch mobile)
	(cdr mobile))

(define (make-branch length structure)
	(cons length structure))

(define (branch-length branch)
	(car branch))

(define (branch-structure branch)
	(cdr branch))

(define (total-weight mobile)
	(cond ((null? mobile) 0)
				((not (pair? mobile)) mobile)
				(else (+ (total-weight (branch-structure (left-branch mobile)))
								 (total-weight (branch-structure (right-branch mobile)))))))

(define (helper branch)
	(* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? mobile)
	(if (not (pair? mobile))
			#t
			(and (= (helper (left-branch mobile)) (helper (right-branch mobile)))
					 (balanced? (branch-structure (left-branch mobile)))
					 (balanced? (branch-structure (right-branch mobile))))))

(define mob (make-mobile (make-branch 1 2) (make-branch 1 2)))
(display (total-weight mob)) (newline)
(display (balanced? mob)) (newline)
