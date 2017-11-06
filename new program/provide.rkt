#lang racket

(require "AsipMain.rkt")
(provide
cons1
cons2
cons3
 )

(define leds (list 12 11 10 9 8 7 6 5 4))

(define s (λ ()(sleep 0.25)))
(define a (λ ()(sleep 0)))

(define h (λ (x) (digital-write x HIGH) ))
(define l (λ (x) (digital-write x LOW) ))


(define cons1 
  (λ ()
   
  (h 12) (s) (h 11) (s) (h 10) (s) (h 9) (s) (l 12) (h 8) (s) (l 11) (h 7) (s) (l 10) (h 6) (s) (l 9) (h 5) (s) (l 8) (h 4) (s) (l 7) (s) (l 6) (s) (l 5) (s) (l 4)

     
   (cons1)
    ))


(define cons2
  (λ ()
 
    (h 8)(s)(h 9)(h 7)(s)(h 10)(h 6)(s)(l 8)(s)(h 11)(h 5)(s)(l 9)(l 7)(s)(h 12)(h 4)(s)(l 10)(l 6)(s)(l 11)(l 5)(s)(l 12)(l 4)
  
    (cons2)
    ))


(define cons3
  (λ ()

(h 4)(s)(h 5)(s)(h 6)(s)(h 7)(s)(l 4)(h 8)(s)(l 5)(h 9)(s)(l 6)(h 10)(s)(l 7)(h 11)(s)(l 8)(h 12)(s)(l 9)(s)(l 10)(s)(l 11)(s)(l 12)
                                                              
 (cons3) 
    ))

(define conslist (list cons1 cons2 cons3))


