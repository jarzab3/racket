#lang racket/gui

(define (make-colored-bm color:str)
  [define bm (make-object bitmap% 200 200)]
  [define dc (make-object bitmap-dc% bm)]
  (send dc set-brush (make-object brush% color:str 'solid))
  (send dc draw-rectangle 0 0 200 200)
  (send dc set-bitmap #f)
  bm)

(define frame (new frame% [label "test"] [width 200] [height 200]))

(define panel (new panel% [parent frame]))

(define button-colors 
  (shared ([c (append (map make-colored-bm '("green" "red" "blue")) c)])
    c))

(define buttn  
  (new button%
       [label (car button-colors)]
       [parent panel]
       [callback (lambda (b e) 
                   (set! button-colors (cdr button-colors)) 
                   (send buttn set-label (car button-colors)))]))

(send frame show #t)