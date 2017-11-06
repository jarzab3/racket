#lang racket

(require "AsipMain.rkt")

;; asip minimal program

(define preliminaryOperations 
  (λ ()
    (open-asip)  
    ;; put your setup code here, to run once:
    ) ;; end of lambda
  ) ;; end of setup

(define yourMainApplicationLogic 
  (λ ()
    (define led1 12)
(define aRandomBlinker
(λ ()
(define delay (+ .1 (random)))
(digital-write led1 HIGH)
(sleep delay)
(displayln delay)
(digital-write led1 LOW)
(sleep delay)
(aRandomBlinker)
)
);; put your main code here, to run repeatedly:
    (sleep 1)
    (yourMainApplicationLogic)
    )
  )

(preliminaryOperations)
(yourMainApplicationLogic)

