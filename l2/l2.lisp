; 10. Decide whether a tree of type (2) is balanced (the difference between
;     the depths of the two subtrees is not larger than 1).
; (A (B) (C (D) (E)))			(2)

(defun maxlevel (tree)
  (cond
    ((null tree) 0)
    ((null (cdr tree)) 1)
    (t (1+ (maxchildren (cddr tree) (maxlevel (cadr tree)))))
    )
  )

(defun maxchildren (children cmax)
  (cond
    ((null children) cmax)
    (t (maxchildren (cdr children) (max cmax (maxlevel (car children)))))
    )
  )

  (defun minlevel (tree)
    (cond
      ((null tree) 0)
      ((null (cdr tree)) 1)
      (t (1+ (minchildren (cddr tree) (minlevel (cadr tree)))))
      )
    )

  (defun minchildren (children cmin)
    (cond
      ((null children) cmin)
      (t (minchildren (cdr children) (min cmin (minlevel (car children)))))
      )
    )

(defun balanced (tree)
  (<= (abs (- (maxlevel tree) (minlevel tree))) 1)
  )
