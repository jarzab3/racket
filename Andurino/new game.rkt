#lang racket

(require "AsipMain.rkt")

;; asip minimal program to blink pin 13 every second

(define preliminaryOperationsForMyCode 
  (λ ()
    (open-asip)
    (set-pin-mode 4 INPUT_PULLUP_MODE)
    (set-pin-mode 2 INPUT_PULLUP_MODE)
    (set-pin-mode! 8 OUTPUT_MODE)
    (set-pin-mode! 7 OUTPUT_MODE)
    ) ;; end of lambda
  ) ;; end of setup

(define ct (current-milliseconds))
(define p1 0)
(define p2 0)
(define ft 0)
(define finished #f)
(define myFantasticApplication 
  (λ ()
      (
    (digital-write 8 HIGH)
    (digital-write 7 HIGH)
    (sleep 2)
    (digital-write 8 LOW)
    (digital-write 7 LOW)
    (displayln "Calculating......")
    (sleep 10)
    (displayln p1)
    (displayln p2)
    (comparePlayers)
    
    (myFantasticApplication)
    )
  ))

(define player1 
  (λ ()
    (cond
      ((equal? (digital-read 4) HIGH)
       (set! p1 (current-milliseconds))
  ))(player1)))

(define player2 
  (λ ()
    (cond
      ((equal? (digital-read 2) HIGH)
       (set! p2 (current-milliseconds))
    )
  )(player2)))
  
(define comparePlayers 
  (λ ()
    
     (cond
      ((> p1 p2)(displayln "Player 2 Wins"))
      ((< p1 p2)(displayln "Player 1 Wins"))
      ((equal? p1 p2)
       (displayln "Draw!!")))
     
   

  ))

(preliminaryOperationsForMyCode)
(myFantasticApplication)
(player1)
(player2)


