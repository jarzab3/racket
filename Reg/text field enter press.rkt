#lang racket

(require racket/gui/base)
(require slideshow racket/class)



(define window1 (new frame%
                     [label "Program"]
                     [width 350] [height 400]  [alignment '(center center)] ))
(send window1 get-top-level-window)


(define panel2 (new vertical-panel% [parent window1][alignment '(center top)] [vert-margin 0]
                    [horiz-margin 0] [stretchable-width #f][stretchable-height #f]))


(define panel1 (new vertical-panel% [parent window1][alignment '(center top)][vert-margin 100]
                    [horiz-margin 0]))


(define canvas1
  (new canvas% [parent panel2]
       [style '(transparent) ]
       [stretchable-width #f][stretchable-height #f]
       [min-width 150] [min-height 40]
       [paint-callback
        (lambda (canvas dc)
          (send dc set-scale 1 1)
          (send dc set-text-foreground "black")
          (send dc draw-text "ATTENDANCE" 25 10)
          (send dc get-text-extent "ATTENDANCE"))]))

;(message-box "Title" "Do you wish to continue?" #f '(yes-no))


;;;;;Registration window 

(define fa (list '()))

(struct reg (name class s-number))

(define tf1
(new text-field%	 
     [label "Name"]	 
     [parent panel1]
     [min-width 200]
     [stretchable-width #f][stretchable-height #f]
     [style '(single vertical-label)]  
     [callback (λ (t e) 
                 (cond
                   ((equal? (send e get-event-type) 'text-field-enter) 
                 (set! fa (displayln (string->list (send t get-value)) ))
                          )))]))


(define tf2
(new text-field%	 
     [label "Student ID"]	 
     [parent panel1]
     [min-width 200]
     [stretchable-width #f][stretchable-height #f]
     [style '(single vertical-label)]
     [callback (λ (t e) 
                 (cond
                   ((equal? (send e get-event-type) 'text-field-enter) 
                (set! fa (displayln (string->list (send t get-value))))
                          )))]))

(define crt void)

(new button% [ parent panel1]
     [label "Submit"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread ))
                        )
                        (else (set! crt (thread)))
                        ))])




(send window1 show #t)




