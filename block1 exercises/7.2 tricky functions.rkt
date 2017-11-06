#lang racket

(define fred (λ (x) (+ x 10)))


(define bill (λ (y) (+ y 2)))


(define sally (λ (k) (* (+ (fred 2) (bill 2)) k)))

(sally 2)

