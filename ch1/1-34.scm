(define (f g)
  (g 2))

(f f)

;; f called on 2, which attempts to make 2 an procedure call
