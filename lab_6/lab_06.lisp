;;1.Напишите функцию, которая уменьшает на 10 все числа из списка-аргумента этой функции.
(defun minus-10 (lst)
  (mapcan #'(lambda (el) (and (numberp el) (list (- el 10)))) lst))

(setf a '(1 2 3 4 5 6))
(minus-10 a)

(defun minus-10-deep (lst)
  (mapcar #'(lambda (el) (cond
                           ((numberp el) (- el 10))
                           ((listp el) (minus-10-deep el))
                           (t el)
                           ))
          lst))

(setf a '(1 2 (3) 4 (5 3 4 56) (6 (23 2 (123 a)))))
(minus-10-deep a)

;; 2. Напишите функцию, которая умножает на заданное число-аргумент все числа
;; из заданного списка-аргумента, когда
;; a) все элементы списка --- числа,
;; б) элементы списка -- любые объекты.
(defun mult-nums (lst num)
  (mapcar #'(lambda (el) (* el num)) lst))

(mult-nums '(1 2 3 4 5) 2)


(defun mult-objects (lst num)
  (mapcar #'(lambda (el)
              (cond ((numberp el) (* el num))
                    ((listp el) (mult-objects el num))
                    (t el)))
          lst))

(setf a '(1 2 (3) 4 (5 3 4 56) (6 (23 2 (123 a)))))
(mult-objects a 2)


;; 3. Написать функцию, которая по своему списку-аргументу lst определяет
;; является ли он палиндромом (то есть равны ли lst и (reverse lst)).
(defun polyndromp (lst)
  (equal lst (reduce #'(lambda (prev curr) (cons curr prev)) lst :initial-value nil)))

(polyndromp '(a (b c) (d e) (b c) a))

;; 4. Написать предикат set-equal, который возвращает t, если два его множества-
;; аргумента содержат одни и те же элементы, порядок которых не имеет значения.

(defun is-subset (subset superset)
  (not (find-if-not #'(lambda (el) (find el superset :test 'equal)) subset)))

(defun set-equal (set1 set2) (and (is-subset set1 set2) (is-subset set2 set1)))

(set-equal '((a) b 1) '((a) b 1))

;; 5. Написать функцию которая получает как аргумент список чисел, а возвращает список
;; квадратов этих чисел в том же порядке.
(defun square (lst) (mapcar #'(lambda (el) (* el el)) lst))
(square '(1 2 3))

;; 6. Напишите функцию, select-between, которая из списка-аргумента, содержащего только
;; числа, выбирает только те, которые расположены между двумя указанными границами-
;; аргументами и возвращает их в виде списка (упорядоченного по возрастанию списка чисел
;;                                                           (+ 2 балла)).

(defun betweenp (a b1 b2)
  (if (>= b2 b1)
      (and (>= a b1) (<= a b2))
      (and (>= a b2) (<= a b1))
      ))

(betweenp 2 3 2)

(defun select-between (lst b1 b2)
  (mapcan #'(lambda (el) (and (betweenp el b1 b2) (list el))) lst))

(select-between '(1 2 3 4 5 6 7 8 9 10 11) 5 9)


;; 7. Написать функцию, вычисляющую декартово произведение двух своих списков-
;; аргументов. ( Напомним, что А х В это множество всевозможных пар (a b), где а
;;                         принадлежит А, принадлежит В.)


(defun decart (lst1 lst2)
  (mapcan #'(lambda (el1) (mapcar #'(lambda (el2) (list el1 el2)) lst2))
          lst1))

(decart '(a b c d) '(1 2 3 4 5))

;; 8. Почему так реализовано reduce, в чем причина?
;; (reduce #'+ 0) -> 0
;; (reduce #'+ ()) -> 0

(reduce #'+ 0)

;; 9. Пусть list-of-list список, состоящий из списков. Написать функцию, которая вычисляет
;; сумму длин всех элементов list-of-list, т.е. например для аргумента ((1 2) (3 4)) -> 4.

(defun my-length)

(defun len-deep (lst)
  (reduce #'+ (mapcar #'(lambda (el) (if (not (listp el)) 1 (len-deep el))) lst)))

(len-deep '((1 a 2 2) (3 (2 3) 4) (1 2) 1 2))

