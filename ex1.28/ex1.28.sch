
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
  (cond ((= exp 0)    1)
        ((even? exp) (remainder (squar2 (expmod base (/ exp 2) m)) m))
        (else        (remainder (* base (expmod base (- exp 1) m)) m))
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

(define (fast-prime-log? n)
  (display "  ")
  (display n)
  (display " is ")
  (if (fast-prime? n 100)     
      (display "prime")
      (display "not prime")
  )
  (display "\n")
)
(define (test-prime msg number-list)
  (newline)
  (display msg)
  (newline)
  (map fast-prime-log? number-list)
)

(newline)
(newline)

(test-prime "no prime" (list
  561
  1105  
  1729  
  2465  
  2821  
  6601  
  1000000003  
  1000000013  
  1000000017  
  )
)  

(test-prime "yes prime" (list
  1000003
  1000033
  1000037
  1000000007
  1000000009
  1000000021
) )

(display "\n\ndone\n")
(exit)
