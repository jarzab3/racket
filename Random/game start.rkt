(define fr (new frame% [label "Testing"] [width 300] [height 300]))
(define msg (new message% [parent fr] [label ""]))

(define my-canvas%
  (class canvas% 
    (define/override (on-char key-event)
      (cond
        [(equal? key-event 'up) (send msg set-label "UP")]
        [(equal? key-event 'down) (send msg set-label "DOWN")]
        [(equal? key-event 'left) (send msg set-label "LEFT")]
        [(equal? key-event 'right) (send msg set-label "RIGHT")]
        [else (send msg set-label "Others")]))
    (super-new)))

(new my-canvas% [parent fr]
     [paint-callback
      (lambda (canvas dc)
        (send dc draw-ellipse 140 120 20 20))])

(send fr show #t)