(define (fac n)
  (if (= n 1)
	1
	(* n (fac (- n 1)))))

(define (fac2 n)
  (fac-iter 1 1 n))

(define (fac-iter total counter target)
  (if (> counter target)
	total
	(fac-iter (* total counter) (+ counter 1) target)))

(fac 16)

(fac2 16)
