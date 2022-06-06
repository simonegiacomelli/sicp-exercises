(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

  
(display "load ok")

(define (search-for-primes n count)
  (define (process start-time)
    (define (display-prime)
      (display "  prime found: ")
      (display n)
      (display " time: ")
      (display (- (runtime) start-time))
      (newline)  
      (if (> count 0) (search-for-primes (+ n 1) (- count 1)) ) 
    )

    (if (> count 0) 
      (if (fast-prime? n 100000) (display-prime)  
        (search-for-primes (+ n 1) count)
      )
    ) 
  )
  (process (runtime))
)

(define (ex n)
  (display "Looking for three primes starting from ")
  (display n)
  (newline)
  (search-for-primes n 3)  
)
(newline)
(newline)

(ex 561)
(ex 1105)
(ex 1729)
(ex 2465)
(ex 2821)
(ex 6601)


(display "\n\ndone\n")
(exit)
