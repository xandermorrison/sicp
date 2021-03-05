(define (consx x y)
  (lambda (m) (m x y)))

(define (carx z)
  (z (lambda (p q) p)))

(define (cdrx z)
  (z (lambda (p q) q)))


(carx (consx 8 11))
(cdrx (consx 8 11))

