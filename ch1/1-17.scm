(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double a)
  (+ a a))

(define (halve a)
  (if (= 0 (remainder a 2))
      (/ a 2)
      0))


(define (m a b)
  (mult a b))

(define (mult a b)
  (cond ((= b 0) 0)
	((= 0 (remainder b 2))
	 (double(mult a (halve b))))
	(else (+ a
		 (mult a (- b 1))))))
	
(m 12 15)



