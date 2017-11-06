#lang racket

(require racket/gui/base)

(require "AsipMain.rkt")

(define rea (list 7 6 5 4 3 14 15 16))

(define my 
  (λ ()
    (open-asip)  
    (set-pin-mode! 11 OUTPUT_MODE)
    (set-pin-mode! 10 OUTPUT_MODE)
    (set-pin-mode! 9 OUTPUT_MODE)
    (set-pin-mode! 8 OUTPUT_MODE)

    (map (λ (x) (set-pin-mode  x INPUT_MODE)) rea)
   
    
))

(define read (λ () (map (λ (x) (digital-read x)) rea)))



(define window1 (new frame%
[label "click"]
[width 450] [height 450]))

(define panel1 (new vertical-panel% [parent window1][alignment '(center top)] [vert-margin 0]
                    [horiz-margin 0] [stretchable-width #f][stretchable-height #f]))


(define panel2 (new vertical-panel% [parent window1][alignment '(center top)][vert-margin 10]
                    [horiz-margin 0][stretchable-width #f][stretchable-height #f]))


(define panel3 (new vertical-panel% [parent window1][alignment '(center top)] [vert-margin 20]
                    [horiz-margin 0] [stretchable-width #f][stretchable-height #f]))

(define panel4 (new horizontal-panel% [parent window1][alignment '(center bottom)] [vert-margin 0]
                    [horiz-margin 0] [stretchable-width #f][stretchable-height #f]))

(define crt void) ; current running thread 
          

(new button% [ parent panel1 ]
     [label "ON"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread on1))
                        )
                        (else (set! crt (thread on1)))
                        ))])

(new button% [ parent panel1 ]
     [label "OFF"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread off1))
                        )
                        (else (set! crt (thread off1)))
                        ))])


(new button% [ parent panel2 ]
     [label "ON"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread on2))
                        )
                        (else (set! crt (thread on2)))
                        ))])

(new button% [ parent panel2 ]
     [label "OFF"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread off2))
                        )
                        (else (set! crt (thread off2)))
                        ))])

(new button% [ parent panel3 ]
     [label "ON"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread on3))
                        )
                        (else (set! crt (thread on3)))
                        ))])

(new button% [ parent panel3 ]
     [label "OFF"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread off3))
                        )
                        (else (set! crt (thread off3)))
                        ))])

(new button% [ parent panel4 ]
     [label "READ"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread on4))
                        )
                        (else (set! crt (thread on4)))
                        ))])

(new button% [ parent panel4 ]
     [label "WRITE"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread off4))
                        )
                        (else (set! crt (thread off4)))
                        ))])





(define on1
  (λ ()
    (digital-write 11 HIGH)
    (displayln "1 ON")

    ))

(define off1
  (λ ()
    (digital-write 11 LOW)
(displayln "1 OFF")
    ))

(define on2
  (λ ()
    (digital-write 10 HIGH)
 (displayln "2 ON")
    ))

(define off2
  (λ ()
    (digital-write 10 LOW)
(displayln "2 OFF")
    ))
(define on3
  (λ ()
    (digital-write 9 HIGH)
 (displayln "3 ON")
    ))

(define off3
  (λ ()
    (digital-write 9 LOW)
(displayln "3 OFF")
    ))


(define on4
  (λ ()
    (digital-write 8 HIGH)
    (displayln "READ")
    ))

(define off4
  (λ ()
    (digital-write 8 LOW)
(displayln "WRITE")
    ))

(send window1 show #t)



(my)
