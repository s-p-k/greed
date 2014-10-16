;; swap elements of a pair

(define swap-pair
  (lambda (pr)
    (if (not (pair? pr))
	     (display "swap-pair takes as input a pair\n"))
    (let ((first (car pr))
	   (second (cdr pr)))
      (cons second first))))

;; find if something is not an atom

(define not-atom?
  (lambda (x)
    (if (not (atom? x))
	#t
	#f)))

;; nth element of a list
;; use example:
;; (nth 3 '(1 2 3 4 5 6)) --> 3

(define nth
  (lambda (n lst)
    (cond ((null? lst)
	   'nil)
          ((< n 1) (display "n must be >= 1\n"))
          ((eq? n 1) (car lst))
          (else (nth (- n 1) (cdr lst))))))

;; last element of a list

(define last
  (lambda (lst)
    (cond ((null? lst) 'nil)
	  (else (nth (length lst) lst)))))

;; find if a list's car is negative

(define negative-car?
  (lambda (lst)
    (if (negative? (car lst)) #t #f)))

;; find if a lists car is positive

(define positive-car?
  (lambda (lst)
    (if (positive? (car lst)) #t #f)))

;; find if a list has any negative values
;; currently not working for lists containing lists.

(define neg-in-list-iter
  (lambda (lst n)
    (cond ((eq? n 1)
	   (if (negative-car? lst)
	       #t
	       #f))
	  ((not (eq? n 1))
	   (if (negative-car? lst)
	       #t
	       (neg-in-list-iter
		 (cdr lst)
		 (- n 1))))
	  (else (display "done\n")))))

(define neg-in-list?
  (lambda (lst)
    (cond ((null? lst) lst)
	  ((not (list? lst))
	   (display "please instert a list"))
	  (else
	   (let ((l (length lst)))
	     (neg-in-list-iter lst l))))))

;; check if a sublist exists in a list

(define sublist?
  (lambda (lst)
    (cond ((null? lst)
	   (display "null list\n"))
	  ((not (list? lst))
	   (display "please enter a list\n"))
	  (else (sublist-iter lst)))))

(define sublist-iter
  (lambda (lst)
    (let ((l (length lst)))
      (cond ((eq? l 1)
	     (if (atom? (car lst))
		 #f
		 #t))
	    ((not-atom? (car lst))
	     #t)
	    (else 
	     (- l 1)
	     (sublist-iter (cdr lst)))))))
	   

(define list-sublists
  (lambda (lst)
    (cond ((not (list? lst))
	   (display "not a list\n"))
	  ((null? lst) 'nil)
	  ((not (sublist? lst))
		(display "no sublists exist\n"))
	  (else (list-sublists-iter lst)))))

(define list-sublists-iter
  (lambda (lst)
    (let ((l (length lst)))
       (cond ((eq? l 2)
	      (cond ((and (not-atom? (car lst))
			  (not-atom? (cdr lst)))
		     (begin (display (car lst))
			    (newline)
			    (display (cadr lst))
			    (newline)))
		    ((not-atom? (car lst))
		     (begin (display (cdr lst))
			    (newline)))
		    (else (begin
			    (display (cdr lst))
				     (newline)))))
	      ((not-atom? (car lst))
	       (begin
		 (display (car lst))
		 (newline)
		 (- l 1)
		 (list-sublists-iter (cdr lst))))
	     (else 
	      (begin
		(- l 1)
		(list-sublists-iter
		 (cdr lst))))))))

;; check if an element exists in a list

(define exists-in?
  (lambda (ele lst)
    (cond ((null? lst) #f)
          ((equal? ele (car lst)) #t)
          (else (exists-in? ele (cdr lst))))))

;; return randomly an element of a list. if random is random at all ;)

(define (random-element lst)
  (list-ref lst (random (length lst))))

