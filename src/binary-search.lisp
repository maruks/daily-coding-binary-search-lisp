(defpackage :binary-search
  (:use :cl :iterate)
  (:export binary-search binary-search-2))

(in-package :binary-search)

(defun do-search (xs target left-idx right-idx)
  (when (<= left-idx right-idx)
    (let* ((mid-idx (+ left-idx (floor (- right-idx left-idx) 2)))
	   (mid-val (svref xs mid-idx)))
      (cond ((eql mid-val target) mid-idx)
	    ((> target mid-val) (do-search xs target (1+ mid-idx) right-idx))
	    (t (do-search xs target left-idx (1- mid-idx)))))))

(defun binary-search (xs target)
  (when (plusp (length xs))
    (do-search xs target 0 (1- (length xs)))))

(defun binary-search-2 (xs target)
  (when (plusp (length xs))
    (iterate
      (with left-idx = 0)
      (with right-idx = (1- (length xs)))
      (while (<= left-idx right-idx))
      (let* ((mid-idx (+ left-idx (floor (- right-idx left-idx) 2)))
	     (mid-val (svref xs mid-idx)))
	(if (eql mid-val target)
	    (return mid-idx)
	    (if (> target mid-val)
		(setq left-idx (1+ mid-idx))
		(setq right-idx (1- mid-idx))))))))
