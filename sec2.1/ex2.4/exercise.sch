(define (cons x y) (lambda (m) (m x y)))

(define (car z) (z (lambda (p q) p)))
(define (cdr z) (z (lambda (p q) q)))

(define (test)
  (let ((p (cons 3 11)))
    (display "\ncar=")
    (display (car p) )
    (display "\ncdr=")
    (display (cdr p) )
    )
  )

(test)

(exit)