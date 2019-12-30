(defpackage :binary-search-tests
  (:use :cl :check-it :cacau :assert-p :binary-search))

(in-package :binary-search-tests)

(defparameter *test-gen*
  (generator
   (map (lambda (xs rnd-1 rnd-2) (cons (apply #'vector (delete-duplicates (sort xs #'<)))
				       (if xs (if (oddp rnd-1) (nth (mod rnd-2 (length xs)) xs) rnd-2)
					   rnd-1)))
	(list (integer))
	(integer)
	(integer))))

(deftest "binary-search-test" ()
  (let ((*num-trials* 1000)
	(*list-size* 1000)
	(*size* 1000000))
    (t-p (check-it *test-gen*
		   (lambda (data)
		     (let ((xs (car data))
			   (elem (cdr data)))
		       (eql-p (binary-search xs elem) (position elem xs))))))))

(deftest "binary-search-2-test" ()
  (let ((*num-trials* 1000)
	(*list-size* 1000)
	(*size* 1000000))
    (t-p (check-it *test-gen*
		   (lambda (data)
		     (let ((xs (car data))
			   (elem (cdr data)))
		       (eql-p (binary-search-2 xs elem) (position elem xs))))))))
