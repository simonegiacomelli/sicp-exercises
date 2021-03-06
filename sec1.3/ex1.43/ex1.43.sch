(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)
  (define (rep a x) (if (<= x 1) a (rep (compose f a) (- x 1))))
  (rep f n)
  )

(newline)
(newline)
(display "((repeated square 2) 5) = ")
(display ((repeated square 2) 5))
(newline)
(display "((repeated square 3) 2) = ")
(display ((repeated square 3) 2))
(newline)
(exit)