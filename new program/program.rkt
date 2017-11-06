#lang racket


(require racket/gui/base)
(require "AsipMain.rkt")
(require "provide.rkt")




(define frame1 (new frame%
[label "click"]
[width 450] [height 300]))

(define panel (new vertical-panel% [parent frame1]))


(define crt void) ; current running thread 
          

(new button% [ parent frame1 ]
     [label "option"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread cons1))
                        )
                        (else (set! crt (thread cons1)))
                        ))])

(new button% [ parent frame1 ]
     [label "Stop"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                         
                           (clear-arduino-pin! 12)
                          )))])

(send frame1 show #t)

