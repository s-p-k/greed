;;;; See LICENSE file for details
;;;; misc.scm is part of the greed project, a collection of Scheme utilities.

;; Compute the sum of the geometric progression
;; of 1, 2, 4, 8, ...
;; e.g. geometric-series(5,1) sums the 5 first elements of this
;; geometric progression starting from 1:
;; (+ 1 2 4 8 16) --> 31

(define geometric-series
  (lambda (bets start)
    (let ((a (* 2 start)))
      (geometric-series-iter a bets start))))

(define geometric-series-iter
  (lambda (a bets start)
    (let ((result 0))
      (cond ((eq? bets 1) (- (* 2 (+ result (/ a 2))) start))
	    (else (begin (set! result (+ result (* 2 a)))
			 (geometric-series-iter (* 2 a) (- bets 1) start)))))))

(format #t "; loaded misc successfully.~%; misc is part of the greed project. See the LICENSE file for details.~%")
