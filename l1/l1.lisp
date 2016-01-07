;6.
;  a. Write a function to return the product of all numerical atoms in a list, at any level.
;  b. Write a function to sort a linear list with keeping the double values.
;  c. Write a function to return the union of two sets.
;  d. Write a function to reverse a list.

; a
; product_list(l : List)
; l - list of any elements
(defun product_list (l)
  (cond
    ((null l) 1)
    ((numberp (car l)) (* (car l) (product_list (cdr l))))
    ((listp (car l)) (* (product_list (car l)) (product_list (cdr l))))
    (t 1)
    )
  )

; b
; qsort(l : List)
; l - list of numerical atoms
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

; listl(e : Integer, l : List)
; e - number to compare to
; l - list of numerical atoms
(defun listl (e l)
  (cond
    ((or (null e) (null l)) nil)
    ((< e (car l)) (listl e (cdr l)))
    (t (cons (car l) (listl e (cdr l))))
    )
  )

; listl(e : Integer, l : List)
; e - number to compare to
; l - list of numerical atoms
(defun listge (e l)
  (cond
    ((or (null e) (null l)) nil)
    ((>= e (car l)) (listge e (cdr l)))
    (t (cons (car l) (listge e (cdr l))))
    )
  )

; c
; exists(e : Atom, l : List)
; e - Atom to be searched for
; l - list to search in
(defun exists (e l)
  (cond
    ((or (null e) (null l)) nil)
    ((eq (car l) e) t)
    (t (exists e (cdr l)))
    )
  )

; merge_sets(a : List, b : List)
; a, b - sets of elements
(defun merge_sets (a b)
  (cond
    ((null a) b)
    ((null b) a)
    ((exists (car b) a) (merge_sets a (cdr b)))
    (t (cons (car b) (merge_sets a (cdr b))))
    )
  )

; d
; reverse_list(l : List)
; l - list of any elements
(defun reverse_list (l)
  (cond
    ((null l) nil)
    (t (append (reverse_list (cdr l)) (list (car l))))
    )
  )
