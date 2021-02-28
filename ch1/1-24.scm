(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))
      false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (even? n)
  (= (remainder n 2) 0))

(define (search-for-primes start-n end-n)
  (cond ((even? start-n) (search-for-primes (+ 1 start-n) end-n))
	((< start-n end-n)
	 (timed-prime-test start-n)
	 (search-for-primes (+ start-n 2) end-n))))

(define (search-for-primes-2 start-n count)
  (cond ((even? start-n) (search-for-primes-2 (+ 1 start-n) count))
	((< count 3)
	 (if (timed-prime-test start-n)
	     (search-for-primes-2 (+ 2 start-n) (+ 1 count))
	     (search-for-primes-2 (+ 2 start-n) count)))))

;(define (square n)
 ; (* n n))

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

;(trace search-for-primes)
;(search-for-primes-2 1000000000000000 0)

(search-for-primes-2 1000 0)
