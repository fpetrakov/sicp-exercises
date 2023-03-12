(define (make-table same-key?)
	(let ((local-table (list '*table*)))
		(define (assoc key records)
			(cond ((null? records) #f)
						((same-key? key (caar records)) (car records))
						(else (assoc key (cdr records)))))

		(define (lookup key1 key2)
			(let ((subtable (assoc key1 (cdr local-table))))
				(if subtable
						(let ((record (assoc key2 (cdr subtable))))
							(if record
									(cdr record)
									#f))
						#f)))
						
		(define (insert! key1 key2 value)
			(let ((subtable (assoc key1 (cdr local-table))))
				(if subtable
						(let ((record (assoc key2 (cdr subtable))))
							(if record
									(set-cdr! record value)
									(set-cdr! subtable
														(cons (cons key2 value)
																	(cdr subtable)))))
						(set-cdr! local-table
											(cons (list key1
																	(cons key2 value))
														(cdr local-table)))))
			'ok)

		(define (dispatch m)
			(cond ((eq? m 'lookup) lookup)
						((eq? m 'insert!) insert!)
						(esle (error "Unknown operation -- TABLE" m))))
						
		dispatch))