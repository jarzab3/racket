#lang racket
(require racket/gui)

(define my-frame%
  (class frame%
    (super-new)
    (define/override (on-subwindow-focus r e)
      (when (and e (eq? 'object:text-field% (object-name r)))
        (printf "selected ~a~n" (send r get-label))))))

(define frame (new my-frame% [label "Frame"]))
(define field-1 (new text-field% [label "field-1"] [parent frame])) ;; add field to frame
(define field-2 (new text-field% [label "field-2"] [parent frame]))
(define field-3 (new text-field% [label "field-3"] [parent frame]))

(send frame show #t) 