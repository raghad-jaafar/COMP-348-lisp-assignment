(defun getLeftChild (lst)
    (if (null lst) 
        lst
        (car(cdr lst))
    )
)
(defun getRightChild (lst)
    (if (null lst) 
        lst
        (car(cdr(cdr lst)))
    )
)
(defun isBinarySearchTree(lst)
    (and
        (if (car(getLeftChild lst))
            (if(listp(getLeftChild lst))
                (if(>=(car lst) (car(getLeftChild lst)))
                    (isBinarySearchTree (getLeftChild lst))
                    nil
                )
                (if(getLeftChild lst)
                    (>= (car lst)(getLeftChild lst))
                    T
                )
            )
            T
        )
        (if (car(getRightChild lst))
            (if(listp(getRightChild lst))
                (if(<(car lst) (car(getRightChild lst)))
                    (isBinarySearchTree (getRightChild lst))
                    nil
                )
                (if(getRightChild lst)
                    (< (car lst)(getRightChild lst))
                    T
                )
            )
            T
        )
        
    )
)
(print(isBinarySearchTree '(8 (3 (1 () ()) (6 (4 () ())(7 () ()))) (10 () (14 (13 () ()) ())))))