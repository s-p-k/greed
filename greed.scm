;;;; See LICENSE file for details
;;;; greed.scm

(define greed-version "0.1")

(load "misc.scm")
(load "list-utils") ;; always load list-utils before resistors since resistors
(load "resistors")  ;; use list-utils.
(format #t
	"; greed-v~A loaded successfully.~%; See LICENSE file for details~%"
	greed-version)
