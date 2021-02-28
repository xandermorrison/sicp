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

(cont-frac (lambda (x) 1.0)
	   (lambda (x) 1.0)
	   100)
