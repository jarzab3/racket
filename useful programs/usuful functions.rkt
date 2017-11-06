#lang racket
(require racket/gui/base)

(define frame1 (new frame%
[label "example"]
[width 600] [height 500]))

(define sleep-time 0)

(define panel1 (new vertical-panel% [parent frame1] [alignment '(left center )]
                    [vert-margin 0][horiz-margin 0]))
(define panel2 (new vertical-panel% [parent frame1] [alignment '(right center)]
                    ))
(define panel3 (new vertical-panel% [parent frame1] [alignment '(left center )]
                    [vert-margin 0][horiz-margin 50]))

(define crt void)

(new slider%
     [label "on"]
     [min-value 1]
     [max-value 10]
     [parent panel1]
     [style '(vertical)]

     
[stretchable-height #t] [stretchable-width #t]
     [callback (λ  (s e)
               ; (displayln (send s get-value))
                (set! sleep-time (send s get-value))
               ;  (set! t (send s get-value)) 
                ;;(displayln (send e get-event-type))
                ; (send e get-time-stamp)
               ;  (send s get-value)
                 ;(send s set-value 7); controled by pot receiving value 

                )])


(new button% [ parent panel2 ]
     [label "RUN1"]
  
     [callback (λ (b e)
                     (thread loop)
                        )])
               




(define loop  (λ ()
          (displayln "111")
          (sleep sleep-time)
          (displayln "222")
          (sleep sleep-time)
          (loop)
               ))





(define co1 (λ ()
      (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread loop))
                        )
                        (else (set! crt (thread loop)))
                        )))



(define rev (λ (x)
              (cond
                ((equal? x (- 10)) (- 10))
                ((displayln (- x 1))(sleep 1)(rev (- x 1))))))

(define frame (new frame% [label "Example"]))





(send frame1 show #t)
