(define (cont-frac-iterative n d k)
  (define (cf i a)
    (if (= i 0)
      a
      (cf (- i 1) (/ (n i) (- (d i) a)))
    )
  )
  (cf k 0)
)

(define (tan-cf x k)
  (cont-frac-iterative
   (lambda (i) (if (= i 1) x (* x x)))
   (lambda (i) (- (* 2 i) 1))
   k
  )
)

(newline)
(newline)
(display "tan(1)=")
(display (tan-cf 1.0 1000))
(newline)
(newline)
(exit)