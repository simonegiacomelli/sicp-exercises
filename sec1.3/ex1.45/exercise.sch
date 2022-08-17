;fixed-point, average-damp, and the repeated procedure
(define tolerance 0.0000000001)

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

(define (root-f x avg-damp-n f) (fixed-point ((repeated average-damp avg-damp-n) f) 1.0))
(define (damp-count r)
  (cond
    ;    (#t 10)
    ((>= r 156) 9)
    ((>= r 86) 8)
    ((>= r 44) 7)
    ((>= r 22) 6)
    ((>= r 11) 5)
    ((>= r 8) 4)
    ((>= r 5) 3)
    ((>= r 2) 2)
    (else 1)
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
(display (root-2 2.00000000))
(newline)
(display (root-3 125.00000000))
(newline)
(display (root-4 625.00000000))
(newline)

(load "../../lib/format.sch")

(define (test b n)
  (let ((x (power b n)))
    (display (format "n=~a x=~a y=" n x))
    (let ((y (root-n n x)))
      (display (format "~a ~%" y))
      )
    )
  (if (< n 2000) (test b (+ n 1)))
  )


(define (test2 b n)
  (let ((x (power b n)))
    (display (format "n=~a b=~a x=~a y=" n b x))
    (let ((y (root-n n x)))
      (display (format "~a ~%" y))
      )
    )
  )
(define (loop-n n end l)
  (map (lambda (b) (test2 b n) ) l)
  (if (< n end) (loop-n (+ n 1) end l))
  )

;(loop-n 2 100 (list (/ 1.0 3.0) (/ 2.0 3.0) 5.0 5.1 ))
(loop-n 2 1000 (list (/ 1.0 3.0) (/ 2.0 3.0) 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 ))
(exit)