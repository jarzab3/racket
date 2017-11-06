#lang racket



(require "AsipMain.rkt")


(define my 
  (λ ()
    (open-asip)  
    (set-pin-mode! 5 ANALOG_MODE)
    (set-pin-mode! 4 ANALOG_MODE)
     (set-pin-mode! 9 OUTPUT_MODE)
    ))


(define a (λ ()
            (display (analog-read 5))
            (display "   !   ")
            (sleep 1)
          (display  (analog-read 4))
(display "   !   ")
            (sleep 1)
(a)
            
            ))