#lang racket
(require racket/gui/base)


(define L1 '(1 2 3 4 5 6))




(define rev  (λ (some number)
               (cond
                 ((= y 0) 1)
                 (#t (* some (rev some(- y 1)))))))


                    
(define rea (λ (x)
              (let ([w 1])
                (+ w 2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define fa (list '()))

(define window1 (new frame%
                     [label "Program"]
                     [width 600] [height 500]  [alignment '(center center)] ))
(send window1 get-top-level-window)

(define panel1 (new vertical-panel% [parent window1][alignment '(center top)][vert-margin 150]
                    [horiz-margin 250]))

(define tf1
(new text-field%	 
     [label "Name"]	 
     [parent panel1]
     [min-width 250]
     [style '(single vertical-label)]  
     [callback (λ (t e) 
           
            (displayln (string->list (send t get-value)))
                          )]))





(define crt void)

(define button1
(new button% [ parent panel1]
     [label "Submit"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread ))
                        )
                        (else (set! crt (thread )))
                        ))]))

                 


















(send window1 show #t)