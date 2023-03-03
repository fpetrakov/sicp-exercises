(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define (deriv exp var)
	(cond [(number? exp) 0]
				[(variable? exp) 
					(if same-variable? exp var) 
					1 
					(else 0)]
				[else 
					((get 'deriv (operator exp)) (operands exp) var)]))

;; a
; Мы не можем включить предикаты number? и variable? в операцию выбора,
; потому что они представляют собой число и символ. Вообще, если мы предствим
; их в виде листов, например (number 123), то можно будет включить их
; в операцию выбора

;; b
(define (=number? exp num)
	(and (number? exp) (= exp num)))

(define (make-sum a1 a2)
	(cond ((=number? a1 0) a2)
				((=number? a2 0) a1)
				((and (number? a1) (number? a2)) (+ a1 a2))
				(else (list '+ a1 a2))))

(define (make-product m1 m2)
	(cond ((or (=number? m1 0) (=number? m2 0)) 0)
				((=number? m1 1) m2)
				((=number? m2 1) m1)
				((and (number? m1) (number? m2)) (* m1 m2))
				(else (list '* m1 m2))))

(define (install-sum-package)
	; internal procedures
	(define (addend s)
		(cadr s))

	(define (augend s)
		(caddr s))

	(define (deriv-sum)
     (make-sum
       (deriv (addend exp) var)
       (deriv (augend exp) var)))
	
	; public interface
	(put 'deriv '+ deriv-sum)
'done)

(define (install-product-package)
	; internal procedures
	(define (multiplier p)
		(cadr p))

	(define (multiplicand p)
		(caddr p))

	(define (deriv-product)
     (make-sum
       (make-product (multiplier exp)
                     (deriv (multiplicand exp) var))
       (make-product (deriv (multiplier exp) var)
                     (multiplicand exp))))
										
	; public interface
	(put 'deriv '* deriv-product)
'done)
