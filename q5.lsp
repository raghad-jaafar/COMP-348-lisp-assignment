(defun reverseList (lst)
    (cond 
        ((null lst) '())
        (t (append (reverseList (cdr lst)) (list (car lst))))))
        
;part A of question 5
(defun tribonacci-A (n) 
    (setf x 0)
    (setf y 0)
    (setf z 1)
         (let (lst) 
             (dotimes (count n lst)
                 (setf lst (cons x lst))
                 (setf temp (+ x y z))
                 (setf x y)
                 (setf y z)
                 (setf z temp))
             (reverseList lst)))

(print "iterative solution")
(print (tribonacci-A 7))

;part B of question 5
(defun tribonacci-B (n &optional (x 0) (y 0) (z 1) (lst ()))
    (if (equal n 0)
        (reverseList lst)
        (tribonacci-B (1- n) y z (+ x y z) (cons x lst))))

(print "recursive solution")
(print (tribonacci-B 7))