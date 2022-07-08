(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "\nguess: ")
      (display next)
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(newline)
(newline)
(define result
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)
)

(display "\n\np result: ")
(display result)
(exit)