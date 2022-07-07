(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))
    )
  )
  (iter a 1)
)

(define (product-recursive term a next b)
  (if (> a b)
    1
    (* (term a) (product term (next a) next b))
  )
)

(define (identity x) x)
(define (inc x) (+ x 1))
(define (add-2 x) (+ x 2))

(define (factorial n)
  (product identity 1 inc n)
)

(define (pi/4 x)
  (define n (* 2 x)) ; prerequisite for this optimization: n is even
  (define (num) (* 2 (square (product identity 4 add-2 n)) (+ n 2)))
  (define (den) (square (product identity 3 add-2 (inc n))))
  (define nu (num))
  (define de (den))
  (/ nu de)
)

(newline)
(display "4! = ")
(display (factorial 4))
(newline)
(define pi4 (pi/4 1000))
(display "pi = ")
(display (* 4.0 pi4))
(newline)

(exit)