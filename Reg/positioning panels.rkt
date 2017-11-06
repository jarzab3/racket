#lang racket
(require racket/gui/base)
(require racket/draw)



(define window1 (new frame%
                     [label "Example"]
                     [width 600] [height 500]  [alignment '(center center)] ))


;(define panel1 (new vertical-panel% [parent window1][alignment '(left top)][vert-margin 10]
 ;                   [horiz-margin 1]))

;(define panel2 (new vertical-panel% [parent window1][alignment '(right top)][vert-margin 10]
 ;                   [horiz-margin 1]))

(define panel1 (new horizontal-panel% [parent window1] [alignment '(left top)]
                    [vert-margin 1][horiz-margin 10]))

(define panel2 (new horizontal-panel% [parent window1] [alignment '(right top)]
                    [vert-margin 1][horiz-margin 10]))

(define panel3 (new horizontal-panel% [parent window1] [alignment '(left bottom)]
                    [vert-margin 1][horiz-margin 10]))

(define panel4 (new horizontal-panel% [parent window1] [alignment '(right bottom)]
                    [vert-margin 1][horiz-margin 10]))

(
define
 target
 (
make-bitmap
 30
 30
)
)
 ;
; A 30x30 bitmap
( define
  dc
  (
   new
   bitmap-dc%
   [
    bitmap
    target
    ]
   )
  )


(
send
 dc
 set-brush
 "green"
'
solid
)





(send window1 show #t)