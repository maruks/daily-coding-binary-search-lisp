;;;; binary-search.asd

(defsystem "binary-search"
  :description "Describe binary-search here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (:iterate)
  :components ((:module "src"
		:components ((:file "binary-search"))))
  :in-order-to ((test-op (test-op "binary-search/tests"))))

(defsystem "binary-search/tests"
  :license "Specify license here"
  :depends-on (:binary-search
	       :check-it
	       :cacau
	       :assert-p)
  :serial t
  :components ((:module "tests"
		:components ((:file "binary-search-tests"))))
  :perform (test-op (o c) (symbol-call 'cacau 'run :colorful t :reporter :list)))
