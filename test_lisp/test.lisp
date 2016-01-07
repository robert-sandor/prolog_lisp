(defun getmax (l cmax)
  (cond
    ((null l) cmax)
    ((listp (car l)) (getmax (car l) cmax))
    ((and (numberp (car l)) (> (car l) cmax)) (getmax (cdr l) (car l)))
    (t (getmax (cdr l) cmax))
    )
  )

(defun elim (e l)
  (cond
    ((null l) `())
    ((listp (car l)) (cons (elim e (car l)) (elim e (cdr l))))
    ((eq e (car l)) (elim e (cdr l)))
    (t (cons (car l) (elim e (cdr l))))
    )
  )

(defun solve (l)
  (elim (getmax l 0) l)
  )
