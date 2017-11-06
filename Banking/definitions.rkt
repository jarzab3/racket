#lang racket




(define account%
(class object%
(super-new)
(field (balance 0)) 
(define/public (add n) 
(set! balance (+ n balance )))
(define/public (get-balance ) balance )
)
)


(define savings% (class account%
 (super-new )
 (field (interest 0.04))
 (define/public (add-interest )
 (send this add interest (send this get-balance)))))

(define u void)



(let ([x 5])
    (let ([x 2]
          [y x])
(list y x)))


;(send mysimpleaccount add 100)
;(send jarzab3 add 100)
