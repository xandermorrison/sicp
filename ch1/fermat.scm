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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

;;(remainder (* 5 (expmod 5 6 7)) 7)

;;(remainder (* 5 (remainder (square (expmod 5 3 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder (* 5 (expmod 5 2 7)) 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder (* 5 (remainder (square (expmod 5 1 7)) 7)) 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder (* 5 (remainder (square (remainder (* 5 (expmod 5 0 7)) 7)) 7)) 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder (* 5 (remainder (square (remainder (* 5 1) 7)) 7)) 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder (* 5 (remainder (square (remainder 5 7)) 7)) 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder (* 5 (remainder (square (remainder 5 7)) 7)) 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder (* 5 (remainder (square 5) 7)) 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder (* 5 (remainder 25 7)) 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder (* 5 4) 7)) 7)) 7)

;;(remainder (* 5 (remainder (square (remainder 20 7)) 7)) 7)

;;(remainder (* 5 (remainder (square 6) 7)) 7)

;;(remainder (* 5 (remainder 36 7)) 7)

;;(remainder (* 5 1) 7)

;;(remainder 5 7)

;;5
