

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

  
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))
  
(define (next n) 
  (if (= n 2) 3 (+ n 2))
) 
  
(define (prime? n)
  (= n (smallest-divisor n)))

(display "load ok")

(define (search-for-primes n count)
  (define (process sm-div start-time)
    (define (display-prime)
      (display "  prime found: ")
      (display n)
      (display " time: ")
      (display (- (runtime) start-time))
      (newline)  
      (if (> count 0) (search-for-primes (+ n 1) (- count 1)) ) 
    )
    (if (> count 0) 
      (if (= n sm-div) (display-prime)  
        (search-for-primes (+ n 1) count)
      )
    )
  )
  (process (smallest-divisor n) (runtime)) 
)

(define (ex n)
  (display "Looking for three primes starting from ")
  (display n)
  (newline)
  (search-for-primes n 3)  
)
(newline)
(newline)

(ex 1000)
(ex 10000)
(ex 100000)
(ex 1000000)

(ex 10000000000000)
(ex 100000000000000)
(ex 1000000000000000)
(ex 10000000000000000)
(ex 100000000000000000)


(display "\n\ndone\n")
(exit)
