(define tolerance 0.00001)
(define dx 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
      dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x)
    (+
      (* 1 x x x)
      (* a x x)
      (* b x)
      (* c 1)
    )
  )
)
(define (ex1.40)
  (newtons-method (cubic 3 4 5) 1)
)

(newline)
(newline)

(display (ex1.40))

(exit)