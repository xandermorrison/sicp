(define (iterative-improve good-enough? improve)
  (define (process guess)
    (if (good-enough? guess)
	guess
	(process (improve guess))))
  process)

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  ((iterative-improve good-enough? improve) 1.0))

(sqrt 9)

(define tolerance 0.0000001)

(define (fixed-point f guess)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) 1.0))


(define (fixed-point2 f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
          (try next))))
  (try first-guess))

(fixed-point sin 1.0)
