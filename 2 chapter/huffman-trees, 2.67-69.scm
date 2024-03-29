(define (make-leaf symbol weight)
	(list 'leaf symbol weight))

(define (leaf? object)
	(eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
	(list left
				right
				(append (symbols left) (symbols right))
				(+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
	(if (leaf? tree)
			(list (symbol-leaf tree))
			(caddr tree)))

(define (weight tree)
	(if (leaf? tree)
			(weight-leaf tree)
			(cadddr tree)))

(define (choose-branch bit branch)
	(cond ((= bit 0) (left-branch branch))
				((= bit 1) (right-branch branch))
				(else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (decode bits tree)
	(define (decode-1 bits current-branch)
		(if (null? bits)
				'()
				(let ((next-branch
								(choose-branch (car bits) current-branch)))
					(if (leaf? next-branch)
							(cons (symbol-leaf next-branch)
										(decode-1 (cdr bits) tree))
							(decode-1 (cdr bits) next-branch)))))
	(decode-1 bits tree))
	
(define (adjoin-set x set)
	(cond ((null? set) (list x))
				((< (weight x) (weight (car set))) (cons x set))
				(else (cons (car set)
										(adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
	(if (null? pairs)
			'()
			(let ((pair (car pairs)))
				(adjoin-set (make-leaf (car pair)
															 (cadr pair))
										(make-leaf-set (cdr pairs))))))

(define sample-tree
	(make-code-tree (make-leaf 'A 4)
									(make-code-tree
										(make-leaf 'B 2)
										(make-code-tree (make-leaf 'D 1)
																		(make-leaf 'C 1)))))


; 2.67
; (A D A B B C A)
(define sample-bits '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(display (decode sample-bits sample-tree)) (newline)


; 2.68
(define (memq item seq)
 	(cond ((null? seq) #f)
				((eq? item (car seq)) seq)
				(else (memq item (cdr seq)))))

(define (encode-symbol sym tree)
	(if (leaf? tree)
		(if (eq? sym (symbol-leaf tree))
				'()
				(error "no such symbol in tree -- ENCODE SYMBOL" sym))
		(let ((left (left-branch tree))
					(right (right-branch tree)))
			(if (memq sym (symbols left))
					(cons 0 (encode-symbol sym left))
					(cons 1 (encode-symbol sym right))))))

(define (encode message tree)
	(if (null? message)
			'()
			(append (encode-symbol (car message) tree)
							(encode (cdr message) tree))))

(define sample-message (list 'A 'D 'A 'B 'B 'C 'A))

; (0 1 1 0 0 1 0 1 0 1 1 1 0)
(display (encode sample-message sample-tree)) (newline)	


; 2.69
(define (successive-merge pairs)
	(foldl make-code-tree (car pairs) (cdr pairs)))

(define (generate-huffman-tree pairs)
	(successive-merge (make-leaf-set pairs)))

(display (cadr (make-leaf-set (list (list 'A 1) (list 'B 5) (list 'D 3))))) (newline)
; ((leaf A 1) (leaf D 3) (leaf B 5))

(display (generate-huffman-tree (list (list 'A 1) (list 'B 5) (list 'D 3)))) (newline)