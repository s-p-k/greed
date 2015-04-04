;;;; See LICENSE file for details
;;;; resistors.scm is part of the greed project, a collection of Scheme utilities.

;(load "list-utils.scm")

;; acceptable color bands

(define acceptable-colors
  (list "blk" "brn" "red" "orn" "yel" "gre" "blu" "vio" "gol" "sil" "gra" "whi"))

(define valid-color?
  (lambda (clr)
    (cond ((exists-in? clr acceptable-colors) #t)
	 (else #f))))

(define temp-coef-color
  (lambda (clr)
    (cond ((not (valid-color? clr))
	   (display "temp-coef-color: color not found\n"))
	  ((equal? clr "brn") '100ppm)
	  ((equal? clr "red") '50ppm)
	  ((equal? clr "orn") '15ppm)
	  ((equal? clr "yel") '25ppm)
	  ((equal? clr "blu") '10ppm)
	  (else '5ppm)))) ; it's violet

(define tolerance-color
  (lambda (clr)
    (cond ((not (valid-color? clr))
	   (display "tolerance-color: color not found\n"))
	  ((equal? clr "brn") '1%)
	  ((equal? clr "red") '2%)
	  ((equal? clr "gre") '0.5%)
	  ((equal? clr "blu") '0.25%)
	  ((equal? clr "vio") '0.1%)
	  ((equal? clr "gol") '5%)
	  (else '10%)))) ; it's silver

(define multiplier-color
  (lambda (clr)
    (cond ((not (valid-color? clr))
	   (display "multiplier-color: color not found"))
	  ((equal? clr "blk") 1)
	  ((equal? clr "brn") 10)
	  ((equal? clr "red") 100)
	  ((equal? clr "orn") 1000)
	  ((equal? clr "yel") 10000)
	  ((equal? clr "gre") 100000)
	  ((equal? clr "blu") 1000000)
	  ((equal? clr "vio") 10000000)
	  ((equal? clr "gol") 0.1)
	  (else 0.01)))) ; it's silver

(define first-bands
  (lambda (clr)
    (cond ((not (valid-color? clr))
	   (display "first-bands: color not found\n"))
	   ((equal? clr "blk") 0)
	  ((equal? clr "brn") 1)
	  ((equal? clr "red") 2)
	  ((equal? clr "orn") 3)
	  ((equal? clr "yel") 4)
	  ((equal? clr "gre") 5)
	  ((equal? clr "blu") 6)
	  ((equal? clr "vio") 7)
	  ((equal? clr "gra") 8)
	  (else 9)))) ; it's white

;; usage example:
;; (colors-to-resistance (list "red" "blk" "red")) --> 2000 Ohm, tolerace: 20%

(define colors-to-resistance
  (lambda (lst)
    (cond ((null? lst) (display "null list\n"))
	  ((> (length lst) 6)
	      (display "resistors have max 6 bands, try again\n"))
	  ((eq? (length lst) 3)
	   (let ((res (* (expt 10 (first-bands (caddr lst)))
	      (+ (* (first-bands (car lst)) 10)
		 (first-bands (cadr lst)))))
		 (tol '20%))
	     (begin (display res)
		    (display " Ohm, tolerance: ")
		    (display tol)
		    (newline))))
	  ((eq? (length lst) 4)
	   (let ((res (* (+ (* 10 (first-bands (car lst)))
			    (first-bands (nth 2 lst)))
			    (expt 10 (first-bands (nth 3 lst)))))
		 (tol (tolerance-color (last lst))))
	     (begin (display res)
		    (display " Ohm, tolerance: ")
		    (display tol)
		    (newline))))
	  ((eq? (length lst) 5)
	   (let ((res (* (+ (* 100 (first-bands (car lst)))
			    (* 10 (first-bands (nth 2 lst)))
			    (first-bands (nth 3 lst)))
			 (expt 10 (first-bands (nth 4 lst)))))
		 (tol (tolerance-color (last lst))))
	     (begin (display res)
		    (display " Ohm, tolerance: ")
		    (display tol)
		    (newline))))
	  (else (let ((res (* (+ (* 100 (first-bands (car lst)))
				 (* 10 (first-bands (nth 2 lst)))
				 (first-bands (nth 3 lst)))
			      (expt 10 (first-bands (nth 4 lst)))))
		      (tol (tolerance-color (nth 5 lst)))
		      (coef (temp-coef-color (last lst))))
		  (begin (display res)
			 (display " Ohm, tolerance: ")
			 (display tol)
			 (display " temperature coefficient: ")
			 (display coef)
			 (newline)))))))

(format #t "; resistors loaded successfully.~%")

