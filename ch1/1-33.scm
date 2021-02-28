(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (filter-accumulate2 filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (filter a) (term a) null-value)
       (filter-accumulate filter combiner null-value term (next a) next b))))

(define (filter-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
	  (combiner (term a)
		    (filter-accumulate filter combiner null-value term (next a) next b))
	  (filter-accumulate filter combiner null-value term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (square x) (* x x))

(filter-accumulate prime? + 0 square 1 inc 10)

(define (product-pos n)
  (define (relative-prime? i)
    (= (gcd i n) 1))
  (filter-accumulate2 relative-prime? * 1 identity 1 inc n)))

(product-pos 10)



