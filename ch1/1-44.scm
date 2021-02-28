(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f k)
  (if (= k 1)
      f
      (compose f (repeated f (- k 1)))))

(define dx 0.00001)
(define pi 3.1415)

(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))


;; INCORRECT METHOD
;(define (smooth-n-fold f n)
;  (repeated (smooth f) n))
;((smooth-n-fold square 2) 2)

;(repeated (smooth square) 2)
;(repeated (lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3))
;	  2)
;(compose (lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3))
;	 (repeated (lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3))
;		   1))
;(compose (lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3))
;	 (lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3)))
;((lambda (x) ((lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3))
;	      (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3))) 2)
	      

(define (smooth-n f n)
  ((repeated smooth n) f))
((smooth-n square 2) 2)

;;((repeated smooth 2) square)
;;((compose smooth
;;	  (repeated smooth 1)) square)

;;((compose smooth smooth) square)

;;(((lambda (x) (smooth (smooth x))) square) 2)

;;((smooth (smooth square)) 2)

;;((smooth (lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3))) 2)

;;((lambda (x) (/ (+ ((lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3)) x)
;;		   ((lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3)) (- x dx))
;;		   ((lambda (x) (/ (+ (square x) (square (- x dx)) (square (+ x dx))) 3)) (+ x dx)))
;;		3)) 2)
