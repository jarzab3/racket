#lang racket

(require "AsipMain.rkt")


(provide
cons1
cons2
cons3
leds
clear 
 )

(define leds (list 23 24 25 26 27 28 29 30 31))


(define setup 
  (λ ()    
  (open-asip)
    (map (λ (x) (set-pin-mode  x OUTPUT_MODE)) leds)
    (map (λ (x) (digital-write x LOW)) leds)
    ))

(define clear (λ ()  (map (lambda (x) (digital-write x LOW)) leds)))

(define s (λ ()(sleep 0.25)))
(define a (λ ()(sleep 0)))


(define h (λ (x) (digital-write x HIGH) ))
(define l (λ (x) (digital-write x LOW) ))


(define cons1 
  (λ ()
   
  (h 23) (s) (h 24) (s) (h 25) (s) (h 26) (s) (l 23) (h 27) (s) (l 24) (h 28) (s) (l 25) (h 29) (s) (l 26) (h 30) (s) (l 27) (h 31) (s) (l 28) (s) (l 29) (s) (l 30) (s) (l 31)

     
   (cons1)
    ))


(define cons2
  (λ ()
    
 (h 27)(s)(h 28)(h 26)(s)(h 29)(h 25)(s)(l 27)(s)(h 30)(h 24)(s)(l 28)(l 26)(s)(h 31)(h 23)(s)(l 29)(l 25)(s)(l 30)(l 24)(s)(l 31)(l 23)

   (cons2)
    ))

(define cons3
  (λ ()

    (h 23)(s)(h 24)(s)(h 25)(s)(h 26)(s)(l 23)(h 27)(s)(l 24)(h 28)(s)(l 25)(h 29)(s)(l 26)(h 30)(s)(l 27)(h 31)(s)(l 28)(s)(l 29)(s)(l 30)(s)(l 31)

                                                              
 (cons3) 
    ))

(setup)


(define conslist (list cons1 cons2 cons3))


