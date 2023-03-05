(put 'supertype 'complex #f)
(put 'supertype 'real 'complex)
(put 'supertype 'rational 'real)
(put 'supertype 'scheme-number 'rational)

(define (supertypes type)
  (define (iter next result)
    (let ((super (supertype next)))
      (if super
          (iter super (append '(next) result))
          result)))

  (iter type '()))

(define (supertype type)
  (get 'supertype type))

(define (type<=? type1 type2)
  (or (eq? type1 type2)
      (memq type2 (supertypes type1))))

(define (apply-generic op . args) 
  (define (no-method type-tags) 
    (error "No method for these types" 
      (list op type-tags)))

  (define (raise-one-level args)
    (define (iter rest)
      (if (null? rest)
          (no-method type-tags)
          (let (first (car rest))
            (if (and (supertype first) 
                     (every (lambda (a) (type<=? (type-tag first) (type-tag a))) args))
                (cons (raise first) (cdr rest))
                (cons first (iter (cdr rest)))))))
    
    (iter args))

  (let ((type-tags (map type-tag args))
        (proc (get op type-tags))) 
      (if proc 
          (apply proc (map contents args)) 
          (apply apply-generic op (raise-one-level args)))))