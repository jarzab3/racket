#lang racket

(define s '(2 3 5 6 7 8 9))

( define res (λ (x)
( cond
((empty? x) '())
((odd? (first x)) displayln (first (list x)))
(res ((odd? (first (rest x))) "222")))))





;( remove-if-odd (first (rest x)))))
;(#t ( cons ( first x) ( remove-if-odd( rest x ))))))
