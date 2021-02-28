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
  (mult 0 a b))

(define (mult a b c)
  (cond ((= 0 c) a)
	((= (double (halve c)) c)
	 (mult a (double b) (halve c)))
	(else (mult (+ a b) b (- c 1)))))

(m 12 1)
