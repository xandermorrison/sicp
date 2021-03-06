(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (y k)
    (f (+ a (* k h))))
  (define (term k)
    (* (cond ((or (= k 0)
		  (= k n)) 1)
	     ((even? k) 2)
	     (else 4))
       (y k)))
  
  (/ (* h (sum term 0 inc n)) 3))

(define (cube x) (* x x x))

(simpson cube 0 1 1000.0)
(integral cube 0 1 0.001)
