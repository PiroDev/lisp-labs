((lambda (x) (+ x (logand x 1))) 2)

((lambda (x) (cond ((plusp x) (1+ x)) ((minusp x) (1- x)) (t 0))) 0)

((lambda (x y) (if (> x y) (list y x) (list x y))) 2 1)

((lambda (mid b1 b2) (or (and (>= mid b1) (<= mid b2)) (and (>= mid b2) (<= mid b1)))) 2.5 3 2)

(defun gep (x y) (>= x y))

