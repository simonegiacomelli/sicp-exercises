(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
              (* (numer y) (denom x)))
    (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
              (* (numer y) (denom x)))
    (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
    (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
    (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
    (* (numer y) (denom x))))


(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat
  (add-rat one-half one-third))

(print-rat
  (mul-rat one-half one-third))

(print-rat
  (add-rat one-third one-third))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))
    )
  )

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g)
      (/ d g))))

(print-rat
  (add-rat one-third one-third))

; exercise development

(define (make-rat-pos n d) (cons n d))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (make-rat-pos (/ n g)
      (/ d g))))

(define (test-rat-pos)
  (display "\n\nmake rat pos:")
  (print-rat (make-rat -4 2))
  (print-rat (make-rat 4 -2))
  (print-rat (make-rat -4 -2))
  )

(test-rat-pos)


(define (make-rat-pos n d)
  (if (>= n 0)
    (cons n d)
    (cons (* -1 n) (* -1 d) ))
  )

(test-rat-pos)