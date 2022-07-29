(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)
  (define (rep a x) (if (<= x 1) a (rep (compose f a) (- x 1))))
  (rep f n)
  )

(define dx 0.00001)
(define (smooth f) (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3) ))

(define (n-smooth f n) (repeated (smooth f) n) )

(newline)
(newline)
(display ((smooth square) 0.0) )
(newline)
(display ((n-smooth square 3) 0.0) )
(newline)
(exit)