#lang racket



(define evens '(2 4 6 8))
(define odds  '(1 3 5 7 9))

  
(first odds);1

(rest odds);2

(second odds);3

(rest evens);4

(rest (rest evens));5

(third evens);6

(fourth odds);7

(last odds);8

(first (reverse odds));9

(reverse (rest evens));10

(reverse (rest (rest odds)));11

(rest (reverse odds));12






