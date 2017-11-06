#lang racket

(require racket/gui/base)
(require net/url)


(define mycanvas%
  (class canvas%
    (super-new)
    (inherit get-dc)
    (define/override (on-paint)
      (let ([my-dc (get-dc)])
        (send my-dc draw-bitmap bm 0 0)))))


(define 1-frame%
  
  (class frame%
    
    (super-new)
   
    (define/override (on-subwindow-focus r e)
      (when (and e (eq? 'object:button% (object-name r)))
        (displayln "222")))))


(define bm (make-object bitmap% (get-pure-port
                                 (string->url "https://www.austinbank.com/uploadfiles/Images/personal-banking/online-banking-banner.jpg"))))


(define panel1 (new vertical-panel% [parent 1-frame%][style '(border)][alignment '(center top)] [vert-margin 0][min-height 172]
                    [horiz-margin 0] [stretchable-width #t][stretchable-height #f]))


(define panel2 (new vertical-panel% [parent 1-frame%][style '(border)][alignment '(center center)] [vert-margin 0]
                    [horiz-margin 0] [stretchable-width #t][stretchable-height #t]))



(define panel3 (new vertical-panel% [parent 1-frame%][style '(border)][alignment '(center center)] [vert-margin 0]
                    [horiz-margin 0] [stretchable-width #t][stretchable-height #t]))


(define c (new mycanvas% [parent 1-frame%]))

(define canvas1
  (new canvas% [parent panel2]
       [style '(transparent) ]
       [vert-margin 179]
       [horiz-margin 150]
       [stretchable-width #t][stretchable-height #t]
       [min-width 500] [min-height 70]
       [paint-callback
        (lambda (canvas dc)
          (send dc set-scale 2 2)
          (send dc set-text-foreground "black")
          (send dc draw-text "MAIN PANEL" 75 0)
          )]))

(define canvas2
  (new canvas% [parent 1-frame%]
       [style '(transparent) ]
       [vert-margin 179]
       [horiz-margin 150]
       [stretchable-width #t][stretchable-height #t]
       [min-width 500] [min-height 70]
       [paint-callback
        (lambda (canvas dc)
          (send dc set-scale 2 2)
          (send dc set-text-foreground "black")
          (send dc draw-text "SECOND PANEL" 75 0)
          )]))

(define but
  (new button% [parent 1-frame%]
       [label "Swich to panel 2"]
       [min-height 45]
       [min-width 80]
       [vert-margin 20]
       [horiz-margin 0]
       [callback (λ (b e)
                   (send window1 show #f)
                 
                   )]))

(define but1
  (new button% [ parent 1-frame%]
       [label "Switch to panel 1"]
       [min-height 45]
       [min-width 80]
       [vert-margin 20]
       [horiz-margin 0]
       [callback (λ (b e)
                  
                   (send window1 show #f)
                   
                   (send window1 show #t)
                   )]))



(send window1 show #t)