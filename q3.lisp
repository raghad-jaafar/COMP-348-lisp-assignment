(defun sub-list3 (lst from &optional(to (length lst)))
 (if (and (> from to) (or (< to 1) (< (length lst)  from)))
 (assist-sub-list3 lst 1 (length lst) 1 '())
 (if (and (> to (length lst)) (> from 1))  
 (assist-sub-list3 lst from (length lst) 1 '())
 (if (and (> from to) (and (< to (length lst)) (> from 1)))
 (assist-sub-list3 lst to from 1 '())
 (assist-sub-list3 lst from to 1 '()))
 )))
 (defun assist-sub-list3 (lst from to pos lst2)
(if (>  pos to)
 lst2
(if (<= from pos)
(assist-sub-list3 (cdr lst) from to (+ 1 pos ) (cons (car lst) lst2))
(assist-sub-list3 (cdr lst) from to (+ 1 pos ) lst2)
)))
 
 (write(sub-list3 '(1 4 10) 3 2))

 (write(sub-list3 '(1 4 10) 3))

 (write(sub-list3 '(1 7 12) 4 0))

 (write(sub-list3 '(1 6 12) 4 2))

(write (sub-list3 '(1 3 4 5 6 7) 3 5))
