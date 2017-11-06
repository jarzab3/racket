#lang racket
(require racket/gui/base)


(define fa (list '()))



(define window1 (new frame%
                     [label "Program"]
                     [width 200] [height 250] [alignment '(center top)] ))
;(send window1 get-top-level-window)

(define panel1 (new horizontal-panel% [parent window1] [style '(border)] [alignment '(center top)]))
;(define panel1 (new horizontal-panel% [parent window1][alignment '(center top)][vert-margin 120]
 ;                   [horiz-margin 20]))

(define cv void) ;current

(define tf1
  (new text-field%	 
     [label "Name"]	 
     [parent panel1]
     [min-width 250]
     [style '(single vertical-label)]  
     [callback (λ (t e)
                 cv
                 )]))


(define panel2 (new vertical-panel% [parent panel1]))

(define button1
(new button% [ parent panel2]
     [label "Submit"]
     [callback (λ (b e)      
                (printf "~a ~n" (string->list(send tf1 get-value))))]))

(define crt void)

(send window1 show #t)

