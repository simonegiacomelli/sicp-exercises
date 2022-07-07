(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))
    )
  )
  (iter a 0)
)

(define (add-2 x) (+ x 2))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (term k) (f (+ a (* k h))))
  (*
    (/ h 3)
    (+
      (term 0)
      (* 4 (sum term 1 add-2 (- n 1)))
      (* 2 (sum term 2 add-2 (- n 2)))
      (term n)
    )
  )
)

(define (cube x) (* x x x))

(define (exercise n)
  (display "integral of cube with ")
  (display n)
  (display " iterations are: ")
  (display (simpson-integral cube 0 1 n))
  (newline)
)
(newline)
(exercise 10)
(exercise 100)
(exercise 1000)

(exit)