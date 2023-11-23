;second elem
(car (cdr '((a1 (a2 a3)) a4 a5)))
(car (car (cdr (car '((a1 (a2 a3)) a4 a5)))))

;third elem
(car (cdr (cdr '((a1 (a2 a3)) a4 a5))))
(car (cdr (car (cdr (car '((a1 (a2 a3)) a4))))))

;fourth elem
(car (cdr (cdr (cdr '((a1 (a2 a3) (a4_)) a4 a5 a6)))))
(car (car (cdr (cdr (car '((a1 (a2 a3) (a4_)) a4 a5))))))