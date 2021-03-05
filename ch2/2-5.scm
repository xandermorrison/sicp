(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (finder x count div)
  (if (= 0 (remainder x div))
      (finder (/ x div) (+ count 1) div)
      count))

(define (car x)
  (finder x 0 2))

(define (cdr x)
  (finder x 0 3))

(car (cons 13 17))
(cdr (cons 13 17))
