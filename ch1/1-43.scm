(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f k)
  (define (repeater cumulative k)
    (if (> k 0)
	(repeater (compose f cumulative) (- k 1))
	cumulative))
  (repeater f (- k 1)))

(define (repeated-recur f k)
  (if (= k 1)
      f
      (compose f (repeated2 f (- k 1)))))

((repeated square 2) 5)

