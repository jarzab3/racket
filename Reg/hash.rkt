#lang racket

( define sum
(lambda (l)
( cond
([ empty? l] 0)
(#t (+ (car l) (sum (cdr l ))))
)))

(define h (hash
           1 '(1 2 3 4)
           2 '(a b c d)
           3 '(5 6 7 8)
           4 '(2 3 4 5)
           5 '(6 3 3 4)
           ))

(define a '(1 2 3 4 5))

( define as
(λ (l)
(for ([i l]) (printf "~s \n" i)))

   )

