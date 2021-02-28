(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (* (expmod base (/ exp 2) m)
		       (expmod base (/ exp 2) m))
		    m))
	(else
	 (remaidner (* base (expmod base (- exp 1) m))
		    m))))

;; runs slow because of applicative order evaluation
;; expmod is called twice and "forked" for each even exp
;; also duplicates dividing by two
