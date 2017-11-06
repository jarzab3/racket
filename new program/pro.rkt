#lang racket
(provide
 mo
 )


(require "AsipMain.rkt")


(define my 
  (λ ()
   (open-asip) 
    (set-pin-mode! 12 OUTPUT_MODE)
    (set-pin-mode! 11 OUTPUT_MODE)
    (set-pin-mode! 10 OUTPUT_MODE)
    (set-pin-mode! 9 OUTPUT_MODE)
    (set-pin-mode! 8 OUTPUT_MODE)
    (set-pin-mode! 7 OUTPUT_MODE)
    (set-pin-mode! 6 OUTPUT_MODE)
    (set-pin-mode! 5 OUTPUT_MODE)
    (set-pin-mode! 4 OUTPUT_MODE)
    
))

(define s (λ ()(sleep 0.25)))

(define mo
  (λ ()
    (digital-write 12 HIGH)
    (s)
    (digital-write 11 HIGH)
    (s)
    (digital-write 10 HIGH)
    (s)
    (digital-write 12 LOW)
    (s)
    (digital-write 9 HIGH)
    (s)
    (digital-write 11 LOW)
    (s)
    (digital-write 8 HIGH)
    (s)
    (digital-write 10 LOW)
    (s)
    (digital-write 7 HIGH)
    (s)
    (digital-write 9 LOW)
    (s)
    (digital-write 6 HIGH)
    (s)
    (digital-write 8 LOW)
    (s)
    (digital-write 5 HIGH)
    (s)
    (digital-write 7 LOW)
    (s)
    (digital-write 4 HIGH)
    (s)
    (digital-write 6 LOW)
    (s)
    (digital-write 5 LOW)
    (s)
    (digital-write 4 LOW)
    (mo)
    )
  )

(my)


