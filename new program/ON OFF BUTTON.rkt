#lang racket

(require racket/gui/base)

(require "AsipMain.rkt")


(define my 
  (λ ()
    (open-asip)  
    (set-pin-mode! 48 OUTPUT_MODE)
  
    
))



(define frame1 (new frame%
[label "click"]
[width 450] [height 300]))

(define panel (new vertical-panel% [parent frame1]))


(define crt void) ; current running thread 
          

(new button% [ parent frame1 ]
     [label "ON"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread on))
                        )
                        (else (set! crt (thread on)))
                        ))])

(new button% [ parent frame1 ]
     [label "OFF"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread off))
                        )
                        (else (set! crt (thread off)))
                        ))])


(define on
  (λ ()
    (digital-write 48 HIGH)

    ))



(define off
  (λ ()
    (digital-write 48 LOW)

    ))

(send frame1 show #t)


(my)

