(define (compose f g) (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

(newline)
(newline)
(display ((compose square inc) 6))
(newline)
(exit)