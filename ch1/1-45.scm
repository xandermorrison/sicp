(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f k)
  (if (= k 1)
      f
      (compose f (repeated f (- k 1)))))

(define (power x n)
  (if (= n 1)
      x
      (* x (power x (- n 1)))))

(define (damp-times n)
  (define (calc-damp k times)
    (cond ((> k n) (- times 1))
	  (else (calc-damp (* k 2) (+ times 1)))))
  (let ((k 1)
	(times 0))
    (calc-damp k times)))

(define (nth-root-damped x nth)
  (fixed-point ((repeated average-damp (damp-times nth))
		(lambda (y)
		  (/ x (power y (- nth 1)))))
	       1.0))


(nth-root-damped 2 8)
