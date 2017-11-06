#lang racket
(require racket/gui/base)

(require htdp/gui)

(define w
    (create-window
      (list (list (make-button "QUIT" (lambda (e) (hide-window w)))))))
; A button appears on the screen.
; Click on the button and it will disappear.
> (show-window w)
; The window disappears. 








(define ex1 (new frame%
[label "My Window"]
[width 300] [height 300]))


(define ex2 (new text-field%
                 [label "INPUT"] [parent ex1] 
                 [ vert-margin 50] [ horiz-margin 1]
                 [min-height 75 ] [ stretchable-height #f ][min-width 75 ] [ stretchable-width #t ]
                 ))


(define operation (λ (x)(+ x 2)))

(new button% [ parent ex1 ]
     [label "Calculate"]
     [callback (λ ()
            (send ex2 set-value

              (operation

(send result get-value))))])

(define result(new text-field%
(label "RESULT")
(parent ex1)))
(send ex1 show #t)




