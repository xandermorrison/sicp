(define (square n)
  (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n times)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it times))

(define (fast-prime? n times)
  (cond ((= times 1) true)
	((fermat-test n times) (fast-prime? n (- times 1)))
	(else false)))

(define (fool-fermat n)
  (fast-prime? n (- n 1)))

(fool-fermat 1104)
