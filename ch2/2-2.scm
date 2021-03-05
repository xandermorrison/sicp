(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))

(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment segment)
  (make-point (/ (+ (x-point (car segment)) (x-point (cdr segment)))
		 2)
	      (/ (+ (y-point (car segment)) (y-point (cdr segment)))
		 2)))
