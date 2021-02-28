(define (sum term a next b)
  (define (iter a result)
    (if <??>
	<??>
	(iter <??> <??>)))
  (iter <??> <??>))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ result (term a)))))
  (iter a 0))

(define (sum-rec term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum-rec term (next a) next b))))

(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(sum cube 0 inc 10)

(sum-rec cube 0 inc 10)
