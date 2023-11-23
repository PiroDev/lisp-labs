(defun cons-reverse (src res) (if (null src) res (cons-reverse (cdr src) (cons (car src) res))))
(cons-reverse '(a b c d) nil)

(defun my-reverse (lst) (cons-reverse lst nil))
(my-reverse '(a b c d))

(defun polyndromp (lst) (equal lst (my-reverse lst)))
(polyndromp '(1 2 2 1))

(defun contains (lst el) (cond ((equal (car lst) el) t) ((null lst) nil) (t (contains (cdr lst) el))))
(contains '(a b c) 'f)

(defun intersect-not-null (set1 set2) (cond ((null set1) t) ((contains set2 (car set1)) (intersect-not-null (cdr set1) set2))))
(intersect-not-null '(a b nil c) '(b a))

(defun set-equal (set1 set2) (and (intersect-not-null set1 set2) (intersect-not-null set2 set1)))
(set-equal '(a b c d) '(c b d a))

(setf table (list (cons 'russia 'moscow) (cons 'ukraine 'kiev) (cons 'usa 'washington-dc) (cons 'germany 'berlin)))
(print table)

(defun get-country (table capital) (cond ((null table) nil) ((string= (cdar table) capital) (caar table)) (t (get-country (cdr table) capital))))
(get-country table 'kiev)

(defun replace-and-return-last (lst new-last) (if (null (cddr lst)) (let ((old-last (cdr lst))) (setf (cdr lst) new-last) old-last) (replace-and-return-last (cdr lst) new-last)))

(setf test-lst '(a b c d))

(replace-and-return-last test-lst '(e))
test-lst

(defun swap-first-last (lst) (let ((new-first (replace-and-return-last lst lst))) (setf (cdr new-first) (cdr lst)) (setf (cdr lst) nil) (setf lst new-first)))

(setf test-lst '(a b c d))
(setf test-lst (swap-first-last test-lst))
test-lst

(defun my-nth (lst n)
  (cond ((null lst) nil)
        ((= n 0) lst)
        (t (my-nth (cdr lst) (1- n)))
        ))

(my-nth '(a b c d e f) 3)

(defun swap-help (lst1 lst2)
  (let ((buf (car lst1)))
    (setf (car lst1) (car lst2))
    (setf (car lst2) buf)
    ))

(setf lst '(a b c d e))

()
(print lst)

(defun swap-two-element (lst pos1 pos2)
  (swap-help (my-nth lst pos1) (my-nth lst pos2)))

(setf lst '(a b c d e))
(swap-two-element lst 2 3)
lst

(defun swap-to-left)

(setf lst '(a b c d))
(and (setf (cddddr lst) (cdr lst)) (setf (cdr lst) nil))

(defun my-last (lst)
  (cond ((null (cdr lst)) lst)
        (t (my-last (cdr lst)))
        ))
(my-last '(a b c d))

(defun swap-to-left (lst)
  (let ((old_head (cons (car lst) nil)))
    (setf (cdr (my-last lst)) old_head)
    (setf lst (cdr lst))
    ))
(setf lst '(a b c d e))
(setf lst (swap-to-left lst))

(defun swap-to-right (lst)
  (let ((last_el (replace-and-return-last lst nil)))
    (setf (cdr last_el) lst)
    (setf lst last_el)
    ))

(setf lst (swap-to-right lst))

(setf lst '(a b c d))
((lambda (lst) (setf lst (cdr lst))) lst)
                                        ;???????????
(defun add-to-set (lst el)
  (if (contains lst el) lst (setf lst (cons el lst))))
(setf lst '((a b) (c d) (e f)))
(setf lst (add-to-set lst '(a d)))

(defun get-first-num (lst)
  ())


((lambda (lst) (mapcar #'(lambda (el) (- el 10))) lst) '(1 2 3 4))
