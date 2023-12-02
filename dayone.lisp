(load "~/quickisp/setup.lisp")
(ql:quickload :asdf)
(asdf:load-system "uiop")


(defun get-numbers-from-string (input)
  (setq chars (loop for char across input
                    when (digit-char-p char)
                    collect char))
  (setq first-n-last (list (car char) (car (last char))))
  (parse-integer (coerce first-n-last 'string)))

(defun get-array-of-numbers ()
  (setq lns (uiop:read-file-lines "./input.txt"))
  (loop for line in lns
        collect (get-numbers-from-string line)))


(defun get-total ()
  (reduce #'+ (get-array-of-numbers)))
