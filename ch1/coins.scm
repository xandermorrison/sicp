(define (coin n)
  (cond ((= 1 n) 1)
		((= 2 n) 5)
		((= 3 n) 10)
		((= 4 n) 25)
		((= 5 n) 50)))

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
		((or (< amount 0)
			 (= kinds-of-coins 0)) 0)
		(else (+ (cc (- amount (coin kinds-of-coins)) kinds-of-coins)
				 (cc amount (- kinds-of-coins 1))))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
		((= kinds-of-coins 2) 5)
		((= kinds-of-coins 3) 10)
		((= kinds-of-coins 4) 25)
		((= kinds-of-coins 5) 50)))


(count-change 100)
