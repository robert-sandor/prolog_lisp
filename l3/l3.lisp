(defun max_depth (l)
  (cond
    ((atom l) 0)
    (t (1+ (apply #'max (mapcar #'max_depth l))))
    )
  )
