(define (A x y)
  (cond ((= y 0) 0)
		((= x 0) (* 2 y))
		((= y 1) 2)
		(else (A (- x 1)
				 (A x (- y 1))))))

(A 1 10)

(A 2 1)

(A 3 3)


;; f(n) = 2n
;; g(n) = 2**n
;; h(n) = 2**h(n-1)
