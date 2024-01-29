(defun reverse-list (lst)
    (cond 
        ((null lst) '())
        (t (append (reverse-list (cdr lst)) (list (car lst))))))

(defun remove-dup (lst)
    (setf lsttemp lst)
    (setf lst (remove (car lsttemp) lsttemp))
    (setf li (list (car lsttemp) (car (cdr lsttemp))))
    (setf lst (append li (remove (car lst) lst)))
    (setf lst (remove NIL lst)))

(defun flatten-nums-nodup (lst) 
        (remove-dup (cond 
            ((null lst)
                lst)
            ((listp (car lst))
                (append (flatten-nums-nodup (car lst)) (flatten-nums-nodup (cdr lst))))
            ((and (not (numberp (car lst))) (not (listp (car lst)))) 
                (flatten-nums-nodup (cdr lst)))
            (t
                (cons (car lst) (flatten-nums-nodup (cdr lst)))
            ))))

(print (flatten-nums-nodup '(1 2 (3 1) (a 2.5) (2 4.5) ((1 2)))))