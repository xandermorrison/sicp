(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (identity n) n)
(define (inc x) (+ x 1))

(define (factorial n)
  (product-iter identity 1 inc n))

;; pi = term1 * term2 * 4

(define (term n)
  (/ (if (odd? n) (+ 1 n) (+ 2 n))
     (if (odd? n) (+ 2 n) (+ 1 n))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))
  
(define (approx-pi times)
  (* 4 (product-iter term 1.0 inc times)))

(approx-pi 100000)

(factorial 6)


; 1 2 3 4 5 6 7 8 9 1
; 2 4 4 6 6 8 8 1 1 12
; 3 3 5 5 7 7 9 9


