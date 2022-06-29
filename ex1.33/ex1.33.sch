(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (if (filter a) (combiner result (term a)) result))
    )
  )
  (iter a null-value)
)

(define (sum term a next b filter) (filtered-accumulate + 0 term a next b filter))
(define (mul term a next b filter) (filtered-accumulate * 1 term a next b filter))

(define (identity x) x)
(define (inc x) (+ x 1))

; -----------------------------------------------------------------------------
; ------- prime?

(define (expmod base exp m)
  (define (not-qualify? x) (or (= x 1) (= x (- m 1))))
  (define (squar2 x)
    (define (squared s)
      (if (not-qualify? x)
        s
        (if (= (remainder s m) 1)
          0
          s
        )
      )

    )
    (squared (square x))
  )
  (cond ((= exp 0) 1)
    ((even? exp) (remainder (squar2 (expmod base (/ exp 2) m)) m))
    (else (remainder (* base (expmod base (- exp 1) m)) m))
  )
)


(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1)
  )
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
    ((miller-rabin-test n) (fast-prime? n (- times 1)))
    (else false)))

(define (prime? n) (fast-prime? n 100))

; -----------------------------------------------------------------------------


(define (print msg val)
  (display "\n\n")
  (display msg)
  (display " = ")
  (display val)
  (newline)
)

(print "a) sum of the squares of primes, interval [3 11]" (sum square 3 inc 11 prime?))
(print "b) product of all the positive integers less than n that are relatively prime to n"
 (display "TODO")
)
(exit)