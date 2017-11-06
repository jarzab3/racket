#lang racket

(define a (set 2 4 6 8))
(define b (set 4 8 12))
(define c (set 8 16 24))


(define su (λ (x y)
             (set-union x y)))

(define si (λ (x y)
             (set-intersect x y)))
(define ss (λ (x y)
             (set-subtract x y)))