(setq switch '())
(defun validity (switch)
     (if (> switch 0)
              (print "This is not a valid tree")
              (print "This is a valid tree")
             )
    )



(defun isValid (tree)
    (let ((root (car tree)))
    (let ((leftChildNode (car (car (cdr tree)))))
    (let ((rightChildNode (car (car (cdr (cdr tree))))))
    (let ((leftChild (car (cdr tree))))
    (let ((rightChild (car (cdr (cdr tree)))))
         
         ; Case 1: 1 left & 1 right child 
         (if (and (not (eq leftChild () )) (not (eq rightChild () )))
             (if (and (or (> root leftChildNode) (= root leftChildNode)) (< root rightChildNode))
                 (progn
                     (isValid leftChild)
                     (isValid rightChild)
                  )
             (setq switch (append switch '(F)))
              
             )        
        )
         
         ; Case 2: 1 left, 0 right (and (not (= leftChild () )) (= rightChild () ) ) 
        
         (if  (and (not (eq leftChild () ))  (eq rightChild () ))
          (if (or (> root leftChildNode) (= root leftChildNode)) 
             (isValid leftChild)
             (setq switch (append switch '(F)))
          )         
         )
         
         ; Case 3: 0 left, 1 right (and (= leftChild () )) (not (= rightChild () ) ))
         (if (and (eq leftChild () ) (not (eq rightChild () )))
          (if (< root rightChildNode)         
             (isValid rightChild)
             (setq switch (append switch '(F)))
                     
          )
         )
    
         ;Case 4: 0 left, 0 right 
         (if (and (eq leftChild () ) (eq rightChild () ))
             (return-from isValid)
         )
         
         
         )
        )
       )
      )
     )
    (print switch)
    )
(append ((isValid '(8 (3 (1 () ()) (6 (4 () ())(7 () ()))) (10 () (14 (15 () () ) ())))
))
;;inorder traversal 

(defun inorder(l)
  (if (null l)
      nil
      (inorder-sequence l)))

(defun inorder-sequence(l)
  (case (cadr l)
    (0 (values (list (car l)) (cddr l)))
    (1 (multiple-value-bind (left-subtree rest-of-list) (inorder-sequence (cddr l))
          (values (nconc left-subtree (list (car l))) rest-of-list)))
    (t (multiple-value-bind (left-subtree rest-of-list) (inorder-sequence (cddr l))
          (multiple-value-bind (right-subtree rest-of-rest) (inorder-sequence rest-of-list)
             (values (nconc left-subtree (list (car l)) right-subtree) rest-of-rest))))))

;;preorder traversal

(defun preorder (tree callback-fn)
  (when (consp tree)
    (preorder (second tree) callback-fn) ;; process children first
    (preorder (third tree) callback-fn)
    (funcall callback-fn (first tree)))) ;; then visit parent