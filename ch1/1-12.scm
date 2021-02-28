(define (pascal row column)
  (if (or (= column 0)
		  (= column row))
	1
	(+ (pascal (- row 1) column)
	   (pascal (- row 1) (- column 1)))))

(pascal 4 2)
