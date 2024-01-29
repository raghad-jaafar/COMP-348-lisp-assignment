(defun rev(l)
  (cond ((null l) nil)
        ((listp (car l)) 
	 (append (rev(cdr l)) 
         (list (rev(car l)))))
        (t
          (append (rev (cdr l)) 
                  (list (car l))))))
      
(defun assist-sub-list (lst from to pos lst2)
(if (>  pos to)
(rev lst2)
(if (<= from pos)
(assist-sub-list (cdr lst) from to (+ 1 pos ) (cons (car lst) lst2))
(assist-sub-list (cdr lst) from to (+ 1 pos ) lst2)
)))

(defun sub-list2 (lst from &optional(to (length lst)))
 (if (> from to ) nil
 (if (< from 1) 
 (assist-sub-list lst 1 to 1 '())
 (if (> to (length lst))
 (assist-sub-list lst from (length lst) 1 '())
 (assist-sub-list lst from to 1 '()))))
 )
(write(sub-list2 '(1 4 10) 2 3))

 (write(sub-list2 '(1 4 10) 2))

 (write(sub-list2 '(1 7 12) 1 4))

 (write(sub-list2 '(1 7 12) 0 1))

 (write(sub-list2 '(1 6 12) 4 2))

(write (sub-list2 '(1 3 4 5 6 7) 3 5))