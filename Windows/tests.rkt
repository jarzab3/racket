#lang racket

(require racket/gui)
(require racket/draw)
(require racket/class)



(define 

; Create a dialog
(define dialog (instantiate dialog% ("Example")))
; Add a text field to the dialog
(new text-field% [parent dialog] [label "Your name"])