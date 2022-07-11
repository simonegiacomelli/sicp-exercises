(define (cont-frac-recursive n d k)
  (define (cf i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (cf (+ i 1))))
    )
  )
  (cf 1)
)

(define (cont-frac-iterative n d k)
  (define (cf i a)
    (if (= i 0)
      a
      (cf (- i 1) (/ (n i) (+ a (d i))))
    )
  )
  (cf k 0)
)


(newline)
(newline)
(define (cont-frac msg f)
  (define
    r (f
       (lambda (i) 1.0)
       (lambda (i) 1.0)
       100))

  (display msg)
  (display "\n    result: ")
  (display r)
  (display "\n  1/result:")
  (display (/ 1 r))
  (newline)
  (newline)
)


(cont-frac "iterative" cont-frac-iterative)
(cont-frac "recursive" cont-frac-recursive)
(exit)