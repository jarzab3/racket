#lang racket

;;;;;;;;;;;;;;1

(define L1 '(a b c d e f))

(define L2 '(1 2 3 4 5 6))

(define T1 (λ ()
             (append (reverse L1)
             (reverse L2))
             ))



;;;;;;;;;;;;;;2


(define cons-length (λ () (cons (length L1) L1)))




;;;;;;;;;;;;;3


(define L3 '(a b c d e))



(define silly (λ () (cons L3 (rest(reverse L3)))))



;;;;;;;;;;;4

(define x '(p a p))

(define x1 (reverse x))

(define test (λ () (equal? x x1)))
                
;--------------------

(define test1 (λ (x)
            (equal? x (reverse x))))




