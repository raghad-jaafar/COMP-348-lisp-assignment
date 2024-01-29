(defun preorder (node f)
  (when node
    (funcall f (first node))
    (preorder (second node) f)
    (preorder (third node)  f)))
 
(defun inorder (node f)
  (when node
    (inorder (second node) f)
    (funcall f (first node))
    (inorder (third node)  f)))
(defparameter *tree* '(+ (- (1 () ()) (* (4 () ())(7 () ()))) (/ (7 () ()) (6 () ()))))

 
(defun show (traversal-function)
  (format t "~&~(~A~):~12,0T" traversal-function)
  (funcall traversal-function *tree* (lambda (value) (format t " ~A" value))))
 
(map nil #'show '(preorder inorder ))