#lang racket

(require "AsipMain.rkt")

;; asip minimal program

(define divideTime (λ (x)
                     (+ x 300)))

(define preliminaryOperations 
  (λ ()
    (open-asip) 
    (set-pin-mode! 13 OUTPUT_MODE)
    ;; put your setup code here, to run once:
    ) ;; end of lambda
  ) ;; end of setup



(define ct 0)
(define st 0)
(define pot 0)
(define led #f)


(define yourMainApplicationLogic 
  (λ ()
    (set! ct (current-milliseconds))
    (set! pot (divideTime(analog-read 0)))
    (cond
      ((and (equal? led #f)(> ct (+ st pot) ))
       (digital-write 13 HIGH)
       (set! led #t)
       (displayln "LED On")
       (set! st ct)))
    
    (cond
      ((and (equal? led #t)(> ct (+ st pot) ))
       (digital-write 13 LOW)
       (set! led #f)
       (displayln "LED Off")
       (set! st ct)))
    
    (sleep 0.01)
    (yourMainApplicationLogic)
    )
  )

(preliminaryOperations)

(yourMainApplicationLogic)

