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


(count-change 11)

(cc 11 3)

(+ (cc (- 11 10) 3)
   (cc 11 (- 3 1)))

(+ (cc 1 3)
   (cc 11 2))

(+ (+ (cc (- 1 10) 3)
      (cc 1 (- 3 1)))
   (+ (cc (- 11 5) 2)
      (cc 11 (- 2 1))))

(+ (+ (cc -9 3)
      (cc 1 2))
   (+ (cc 6 2)
      (cc 11 1)))

(+ (+ 0
      (+ (cc (- 1 5) 2)
		 (cc 1 (- 2 1))))
   (+ (+ (cc (- 6 5) 2)
		 (cc 6 (- 2 1)))
      (+ (cc (- 11 1) 1)
		 (cc 11 (- 1 1)))))

(+ (+ 0
      (+ (cc -4 2)
		 (cc 1 1)))
   (+ (+ (cc 1 2)
		 (cc 6 1))
      (+ (cc 10 1)
		 (cc 11 0))))

(+ (+ 0
      (+ 0
		 (cc 1 1)))
   (+ (+ (cc 1 2)
		 (cc 6 1))
      (+ (cc 10 1)
		 0)))

(+ (+ 0
      (+ 0
		 (+ (cc (- 1 1) 1)
			(cc 1 (- 1 1)))))
   (+ (+ (+ (cc (- 1 5) 2)
			(cc 1 (- 2 1)))
		 (+ (cc (- 6 1) 1)
			(cc 6 (- 1 1))))
      (+ (+ (cc (- 10 1) 1)
			(cc 10 (- 1 1)))
		 0)))

(+ (+ 0
      (+ 0
		 (+ (cc 0 1)
			(cc 1 0))))
   (+ (+ (+ (cc -4 2)
			(cc 1 1))
		 (+ (cc 5 1)
			(cc 6 0)))
      (+ (+ (cc 9 1)
			(cc 10 0))
		 0)))

(+ (+ 0
      (+ 0
		 (+ 1
			0)))
   (+ (+ (+ 0
			(cc 1 1))
		 (+ (cc 5 1)
			0))
      (+ (+ (cc 9 1)
			0)
		 0)))

(+ (+ 0
      (+ 0
		 (+ 1
			0)))
   (+ (+ (+ 0
			1)
		 (+ 1 
			0))
      (+ (+ 1 
			0)
		 0)))

O(n^number-of-coins)
