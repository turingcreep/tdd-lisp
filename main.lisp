
(defun check-test (test)
  (let ((description (first test))
        (result (second test)))
  (format *query-io* "~%~a (T/nil): ~a~%" description (not (null (eval result))))))

(defmacro tdd (fn-name tests arguments &body body)
 `(progn
   (defun ,fn-name ,arguments ,@body)
   (flet ((self (args) (funcall #\',fn-name args)))
     (mapcar #'check-test ,tests))
   'tdd-done))

(tdd greet '(("True is always true" T))
  (name)
   (format nil "Hello ~a" name))
