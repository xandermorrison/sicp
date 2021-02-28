;; f(n) = n if n < 3
;; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3

(define (f-rec n)
  (if (< n 3)
	n
	(+ (f-rec (- n 1))
	   (* 2 (f-rec (- n 2)))
	   (* 3 (f-rec (- n 3))))))

(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (< count 3)
	a
	(f-iter (+ a (* 2 b) (* 3 c))
			a
			b
			(- count 1))))

;; f(3) = f(3 - 1) + 2f(3 - 2) + 3f(3 - 3)
;; f(3) = f(2) + 2f(1) + 3f(0)
;; f(3) = 2 + 2 + 0
;; f(3) = 4

;; f(4) = f(3) + 2f(2) + 3f(1)
;; f(4) = 4 + 4 + 3
