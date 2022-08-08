(define (fr n)
  (if (< n 3) n
              (+
                (fr (- n 1))
                (* 2 (fr (- n 2)))
                (* 3 (fr (- n 3)))
                )
    )
  )