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

(define (make-rect-1 segment)
  segment)

(define (make-rect-2 point width height)
  (let ((new-point
	 (make-point (+ (x-point point) width)
		     (+ (y-point point) height))))
    (make-segment point new-point)))

(define (area rect)
  (abs
   (* (- (x-point (start-segment rect)) (x-point (end-segment rect)))
      (- (y-point (start-segment rect)) (y-point (end-segment rect))))))

(define (opposite-sign? x y)
  (and (or (< x 0)
	   (< y 0))
       (not (and (< x 0)
		 (< y 0)))))

(define (perimeter rect)
  (let ((point-one (start-segment rect))
	(point-two (end-segment rect)))
    (define x-side-length
      (let ((x-point-one (x-point point-one))
	    (x-point-two (x-point point-two)))
	(cond ((opposite-sign? (x-point point-one) (x-point point-two))
	       (+ (abs x-point-one) (abs x-point-two)))
	      (else (abs (- x-point-one x-point-two))))))
    (define y-side-length
      (let ((y-point-one (y-point point-one))
	    (y-point-two (y-point point-two)))
	(cond ((opposite-sign? (y-point point-one) (y-point point-two))
	       (+ (abs y-point-one) (abs y-point-two)))
	      (else (abs (- y-point-one y-point-two))))))
    (+ (* 2 x-side-length)
       (* 2 y-side-length))))
     

(define one-point (make-point 2.0 3.0))
(define two-point (make-point 5.0 6.0))
(define three-point (make-point -2.0 -2.0))
(define four-point (make-point -2.0 5.0))

(define segment-one (make-segment one-point two-point))
(define segment-two (make-segment one-point three-point))
(define segment-three (make-segment one-point four-point))
