;; 1. Написать хвостовую рекурсивную функцию my-reverse, которая развернет верхний
;; уровень своего списка-аргумента lst.

(defun cons-reverse (src res) (if (null src) res (cons-reverse (cdr src) (cons (car src) res))))
(cons-reverse '(a b c d) nil)

(defun my-reverse (lst) (cons-reverse lst nil))
(my-reverse '(a b c d))

;; 2. Написать функцию, которая возвращает первый элемент списка -аргумента, который сам
;; является непустым списком.

(defun first-non-empty-list (lst)
  (cond ((null lst) nil)
        ((and (listp (car lst)) (not (null (car lst))) (car lst)))
        (t (first-non-empty-list (cdr lst)))
        ))


(first-non-empty-list '(((a)) a () (b) c d))

;; 4. Написать функцию, которая выбирает из заданного списка только те числа, которые
;; больше 1 и меньше 10.
;; (Вариант: между двумя заданными границами. )


(defun betweenp (a b1 b2)
  (if (>= b2 b1)
      (and (>= a b1) (<= a b2))
      (and (>= a b2) (<= a b1))
      ))

(betweenp 2 3 2)

(defun select-between (lst b1 b2)
  (cond
    ((null lst) nil)
    ((listp (car lst)) (cons (select-between (car lst) b1 b2)
                             (select-between (cdr lst) b1 b2)))
    ((and
      (numberp (car lst))
      (betweenp (car lst) b1 b2)) 
     (cons (car lst) (select-between (cdr lst) b1 b2)))
    (t (select-between (cdr lst) b1 b2))))


(defun select-between-help (lst res b1 b2)
  (cond ((null lst) res)
        ((and (numberp (car lst)) (betweenp (car lst) b1 b2))
         (select-between-help (cdr lst) (nconc res (cons (car lst) nil)) b1 b2))
        (t (select-between-help (cdr lst) res b1 b2))
        )
  )

(defun select-between (lst b1 b2) (select-between-help lst nil b1 b2))

(select-between '(1 2 3 4 5) 4 2)
;; 7. Напишите рекурсивную функцию, которая умножает на заданное число-аргумент все
;; числа
;; из заданного списка-аргумента, когда
;; a) все элементы списка --- числа,
;; 6) элементы списка -- любые объекты.

(defun mult-nums-help (lst num res)
  (cond ((null lst) res)
        (t (mult-nums-help (cdr lst) num (cons (* (car lst) num) res)))
        ))

(defun mult-nums (lst num) (mult-nums-help lst num nil))
(mult-nums '(1 2 3 4 5) 2)

(defun mult-deep-help (lst num res)
  (cond ((null lst) res)
        ((numberp (car lst)) (mult-deep-help (cdr lst) num (nconc res (cons (* (car lst) num) nil))))
        ((atom (car lst)) (mult-deep-help (cdr lst) num (nconc res (cons (car lst) nil))))
        (t (mult-deep-help (cdr lst) num (nconc res (list (mult-deep-help (car lst) num nil))))))
  )

(defun mult-deep (lst num) (mult-deep-help lst num nil))

(mult-deep '(1 (2 (3 a 3)) 3 4) 2)


(nconc nil '(a b c))

;; 8. Написать рекурсивную версию (с именем rec-add) вычисления суммы чисел заданного
;; списка:
;; а) одноуровнего смешанного,
;; б) структурированного.

(defun rec-add-help (lst sum)
  (cond ((null lst) sum)
        ((numberp (car lst)) (rec-add-help (cdr lst) (+ sum (car lst))))
        (t (rec-add-help (cdr lst) sum))
        ))

(defun rec-add (lst) (rec-add-help lst 0))
(rec-add '(1 2 d 3 (da) 4 5))


(defun rec-add-deep-help (lst sum)
  (cond ((null lst) sum)
        ((numberp (car lst)) (rec-add-deep-help (cdr lst) (+ sum (car lst))))
        ((atom (car lst)) (rec-add-deep-help (cdr lst) sum))
        (t (rec-add-deep-help (cdr lst) (+ (rec-add-deep-help (car lst) 0) sum)))
        ))

(defun rec-add-deep (lst) (rec-add-deep-help lst 0))

(rec-add-deep '(1 2 a nil (3 (3 3 3 (10))) 4))

;; 9. Написать рекурсивную версию с именем recnth функции nth.

(nth 1 '(a (b c) d))

(defun recnth (lst num)
  (cond ((null lst) nil)
        ((= num 0) (car lst))
        (t (recnth (cdr lst) (1- num)))
        ))

(recnth '(0 1 (2) 3 4 5) 3)

;; 10. Написать рекурсивную функцию allodd, которая возвращает t когда все элементы списка
;; нечетные.

(defun allodd (lst)
  (cond ((null lst) t)
        ((numberp (car lst)) (and (oddp (car lst)) (allodd (cdr lst))))
        (t (allodd (cdr lst)))
        ))

(allodd '(1 23 3 43 a 5))


;; 11. Написать рекурсивную функцию, которая возвращает первое нечетное число из списка
;; (структурированного), возможно создавая некоторые вспомогательные функции.

(defun first-odd-deep (lst)
  (cond ((null lst) nil)
        ((and (numberp (car lst)) (oddp (car lst))) (car lst))
        ((atom (car lst)) (first-odd-deep (cdr lst)))
        (t (or (first-odd-deep (car lst)) (first-odd-deep (cdr lst))))
        ))

(first-odd-deep '(() a 12 (-13 (1) 2 3) 2 3 4))

;; 12. Используя cons-дополняемую рекурсию с одним тестом завершения,
;; написать функцию которая получает как аргумент список чисел, а возвращает список
;; квадратов этих чисел в том же порядке.

(defun square (lst)
  (cond ((null lst) nil)
        (t (cons (* (car lst) (car lst)) (square (cdr lst))))
        ))

(square '(1 2 3 4))
