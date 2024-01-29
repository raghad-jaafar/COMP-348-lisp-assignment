
(defun depth (element)
           (if (atom element)0
               (1+ (apply (function max) (mapcar (function depth)element)))))
(write (depth NIL))
(write-line "")
(write (depth 1))
(write-line "")
(write (depth'(1)))
(write-line "")
(write (depth'((2))))
(write-line "")
(write (depth '((2)(3 (6))(4))))

