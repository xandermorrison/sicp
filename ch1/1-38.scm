(define (cont-frac n d k)
  (define (fraction total i)
    (if (> 0 i)
	total
	(fraction (/ (n i) (+ (d i) total)) (- i 1))))
  (let ((start (/ (n k) (d k))))
    (fraction start (- k 1))))

(define (cont-frac-recur n d k)
  (define (cont-recur i)
    (if (> i k)
	(/ (n i) (d i))
	(/ (n i) (+ (d i) (cont-recur (+ i 1))))))
  (cont-recur 0))

(define (pattern x)
  (cond ((= 0 x) 1.0)
	((= 0 (remainder (- x 1.0) 3.0)) (* (+ (/ (- x 1.0) 3.0) 1.0) 2.0))
	(else 1.0)))

(cont-frac (lambda (x) 1.0)
		 pattern
		 100)
