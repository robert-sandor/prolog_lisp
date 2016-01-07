;6.
;  a. Write a function to return the product of all numerical atoms in a list, at any level.
;  b. Write a function to sort a linear list with keeping the double values.
;  c. Write a function to return the union of two sets.
;  d. Write a function to reverse a list.

; a
(defun product_list (l)
    (cond
      ((null l) 1)
      ((numberp (car l)) (* (car l) (product_list (cdr l))))
      ((listp (car l)) (* (product_list (car l)) (product_list (cdr l))))
      (t 1)
    )
)

; b
(defun qsort (l)
  (cond
    ((null l) nil)
    (t (append
        (qsort (listl (car l) (cdr l)))
        (cons (car l) nil)
        (qsort (listge (car l) (cdr l)))
        ))
    )
  )

(defun listl (e l)
  (cond
    ((or (null e) (null l)) nil)
    ((< e (car l)) (listl e (cdr l)))
    (t (cons (car l) (listl e (cdr l))))
    )
  )


(defun listge (e l)
(cond
  ((or (null e) (null l)) nil)
  ((>= e (car l)) (listge e (cdr l)))
  (t (cons (car l) (listge e (cdr l))))
  )
)

; c
(defun exists (e l)
  (cond
    ((or (null e) (null l)) nil)
    ((eq (car l) e) t)
    (t (exists e (cdr l)))
    )
  )

(defun merge_sets (a b)
  (cond
    ((null a) b)
    ((null b) a)
    ((exists (car b) a) (merge_sets a (cdr b)))
    (t (cons (car b) (merge_sets a (cdr b))))
    )
  )

; d
(defun reverse_list (l)
  (cond
    ((null l) nil)
    (t (append (reverse_list (cdr l)) (list (car l))))
    )
  )
