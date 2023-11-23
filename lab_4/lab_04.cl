(defun dice_game () (
       
))

(defun dice_player_roll () (
       let ((twice_roll_res ((print dice_roll_twice))))
       (cond (and (dice_rerollp twice_roll_res) ()) (
           if (and (print "Reroll? [y/n]:") (= (read-char) 121))
              (dice_player_roll) twice_roll_res
       )))
))

(defun dice_roll () (1+ (random 6)))

(defun dice_roll_twice () (cons (dice_roll) (dice_roll)))

(defun dice_roll_sum (twice_roll_res) (+ (car twice_roll_res) (cdr twice_roll_res)))

(defun dice_winp (twice_roll_res) (
       let ((sum (dice_roll_sum twice_roll_res)))
       (or (= sum 7) (= sum 11))
))

(defun dice_rerollp (twice_roll_res) (
       let ((sum (dice_roll_sum twice_roll_res)))
       (or (= sum 2) (= sum 12))
))

(dice_winp (print (dice_roll_twice)))
(eql (read-char) 121)
(dice_player_roll)