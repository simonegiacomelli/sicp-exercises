;fixed-point, average-damp, and the repeated procedure
(define tolerance 0.0000000000000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average a b) (/ (+ a b) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))


(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)
  (define (rep a x) (if (<= x 1) a (rep (compose f a) (- x 1))))
  (rep f n)
  )


(define (power b n)
  (cond
    ((= n 1) b)
    ((even? n) (square (power b (/ n 2))))
    (else (* b (power b (- n 1))))
    )
  )

(define (root-f x avg-damp-n f) (fixed-point ((repeated average-damp avg-damp-n) f) 1.00))
(define (damp-count r)
  (cond
    ((= r 2) 1)
    ((= r 3) 1)
    ((= r 4) 2)
    )
  )
(define (root-n n x) (root-f x (damp-count n) (lambda (y) (/ x (power y (- n 1))))))
;(define (root-2 x) (root-f x 1 (lambda (y) (/ x (power y 1)))))
;(define (root-3 x) (root-f x 1 (lambda (y) (/ x (power y 2)))))
;(define (root-4 x) (root-f x 2 (lambda (y) (/ x (power y 3)))))
(define (root-2 x) (root-n 2 x))
(define (root-3 x) (root-n 3 x))
(define (root-4 x) (root-n 4 x))
(newline)
(newline)
(display (root-2 2.00))
(newline)
(display (root-3 125.00))
(newline)
(display (root-4 625.00))
(newline)

(load "../../lib/format.sch")

(define (test n)

  (display (format "n=~a~%" n ))
  (if (< n 10) (test (+ n 1)))
  )

(test 2)
(exit)