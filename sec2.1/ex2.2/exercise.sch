
(define (average a b) (/ (+ a b) 2))
(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment xp yp) (cons xp yp))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
  (let (
         (start (start-segment segment))
         (end (end-segment segment))
         )
    (make-point (average (x-point start) (x-point end)) (average (y-point start) (y-point end)))
    )
  )

(define (print-point p)
;  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (test xs ys xe ye)
  (let (
         (sp (make-point xs ys))
         (ep (make-point xe ye))
         )
    (let (
           (seg (make-segment sp ep))

           )
      (display "\nmid-point=")
      (print-point (midpoint-segment seg))
      (display "\n\n")

      )
    )
  )
(test 2 3 4 7)
(exit)