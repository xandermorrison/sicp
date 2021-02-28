(define (expt-iter a b count)
  (cond ((= count 0) a)
	((even? count) (expt-iter a (* b b) (/ count 2)))
	(else (expt-iter (* a b) b (- count 1)))))

(define (even? a)
  (= (remainder a 2) 0))

(define (expo a b)
  (expt-iter 1 a b))

(expo 6 9)
