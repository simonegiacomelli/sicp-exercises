(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))
;(add-1 zero)
(define one (lambda (f) (lambda (x) (f x))))
;(add-1 (add-1 zero))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define (add-1 n) (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)))))


(define (add a b) (lambda (f) (lambda (x) (a (b f)))))
;(add two two)
(define (add a b) (lambda (f) (lambda (x) (a (lambda (x) (f (f x)))))))
(define (add a b) (lambda (f) (lambda (x) ((lambda (f) (lambda (x) (f x))) ))))




(zero)