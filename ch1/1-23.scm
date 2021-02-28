(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor))))):

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (next test-divisor)
  (if (even? test-divisor)
      (+ test-divisor 1)
      (+ test-divisor 2)))

(define (start-prime-test n start-time)
  (if (prime? n)
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

;(trace search-for-primes)
(search-for-primes-2 1000000000000 0)
