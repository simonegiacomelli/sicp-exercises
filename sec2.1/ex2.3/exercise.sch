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
; first representation
(define (make-rectangle w l) (cons w l))
(define (rectangle-width rect) (car rect))
(define (rectangle-length rect) (cdr rect))
; first end

; second representation
(define (diagonal w l) (sqrt (+ (* w w) (* l l))))
(define (make-rectangle w l) (cons w (diagonal w l)))
(define (rectangle-width rect) (car rect))
(define (rectangle-length rect) (sqrt (- (expt (cdr rect) 2) (expt (rectangle-width rect) 2))))
; second end

(define (rectangle-area rect) (* (rectangle-width rect) (rectangle-length rect)))
(define (rectangle-perimeter rect)
  (+
    (* (rectangle-width rect) 2)
    (* (rectangle-length rect) 2)
    )
  )

(load "../../lib/format.sch")

(define (test)
  (let ((r1 (make-rectangle 2 5)))
    (display (format "\nperimeter=~a\n" (rectangle-perimeter r1)))
    (display (format "area=~a\n" (rectangle-area r1)))
    )
  )

(test)

(exit)