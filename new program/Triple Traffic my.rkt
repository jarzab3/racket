#lang racket

(require "AsipMain.rkt" "AsipButtons.rkt")
(require "prov.rkt")
(require racket/gui/base)

(define frame1 (new frame%
[label "click"]
[width 450] [height 300]))

(define panel (new vertical-panel% [parent frame1]))


(define crt void) ; current running thread

(new button% [ parent frame1 ]
     [label "cons1"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread cons1))
                        )
                        (else (set! crt (thread cons1)))
                        ))])

(new button% [ parent frame1 ]
     [label "cons1"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread cons2))
                        )
                        (else (set! crt (thread cons2)))
                        ))])

(new button% [ parent frame1 ]
     [label "cons3"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread cons3))
                        )
                        (else (set! crt (thread cons3)))
                        ))])


(new button% [ parent frame1 ]
     [label "TURN OFF CONS"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                          (set! crt (thread ((kill-thread co1)clear) ))
                        )
                        (else (set! crt (thread (kill-thread co1))))
                        ))])


(new button% [ parent frame1 ]
     [label "STOP CONS"]
     [ callback (λ (b e)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
                      )))])
                        



(new button% [ parent frame1 ]
     [label "Stop"]
     [ callback (λ (button event)
                  (cond ( (not (equal? crt void))
                          (kill-thread crt)
)))])


(send frame1 show #t)

(define lights (list  13 12 11    10 9 8   7 6 5 ))

(define step-button-pin 2)
(define emergency-button-pin 3)

(define setup 
  (λ ()
 
    (map (lambda (x) (set-pin-mode  x  OUTPUT_MODE)) lights)
    
    (map (lambda (x) (digital-write x LOW)) lights)

    (set-pin-mode! step-button-pin INPUT_MODE)
))



(define currentState 0)


(define stateTable (hash 
                    0 (hash "b" 1 "e" 1)
                    1 (hash "b" 2 "e" 1)
                    2 (hash "b" 3 "e" 1)
                    3 (hash "b" 4 "e" 1)
                    4 (hash "b" 5 "e" 1)
                    5 (hash "b" 6 "e" 1)
                    6 (hash "b" 7 "e" 1)
                    7 (hash "b" 8 "e" 1)
                    8 (hash "b" 9 "e" 1)
                    9 (hash "b" 10 "e" 1)
                   10 (hash "b" 11 "e" 1)
                   11 (hash "b" 12 "e" 1)
                   12 (hash "b" 13 "e" 1)
                   13 (hash "b" 1 "e" 1)
   
                    )
  )


(define lightStates (hash
                     0 (list 0 0 0  0 0 0  0 0 0)
                     1 (list 1 0 0  1 0 0  1 0 0) 
                     2 (list 1 0 0  1 0 0  1 1 0) 
                     3 (list 1 0 0  1 0 0  0 0 1)
                     
                     4 (list 1 0 0  1 0 0  0 1 0)
                     5 (list 1 0 0  1 0 0  1 0 0) 
                     6 (list 1 0 0  1 1 0  1 0 0)
                              
                     7 (list 1 0 0  0 0 1  1 0 0) 
                     8 (list 1 0 0  0 1 0  1 0 0)                     
                     9 (list 1 0 0  1 0 0  1 0 0)
                           
                     10 (list 1 1 0  1 0 0  1 0 0)
                     11 (list 0 0 1  1 0 0  1 0 0)
                     12 (list 0 1 0  1 0 0  1 0 0)
                     13 (list 1 0 0  1 0 0  1 0 0)
                     ))


(define getNextState (lambda (state event) 
  (hash-ref (hash-ref stateTable state 0) event 0)
  ))
                      

(define setLights (lambda (lightPins vals) 
                    (cond [(not (empty? lightPins))
                           (cond [(equal? (first vals) 1)
                                  (digital-write (first lightPins) HIGH)
                                  (printf "Setting light ~s to HIGH\n" (first lightPins) )
                                  ]
                                 (else
                                  (digital-write (first lightPins) LOW)
                                  (printf "Setting light ~s to LOW\n" (first lightPins) )
                                  )
                                 )
                           (setLights (rest lightPins) (rest vals))
                           ]
                          )
                    )
  )

(define (outputCurrentState)
  (setLights lights (hash-ref lightStates currentState))
  )



(define gotoNextState (lambda (ev)
  (let ([newState (getNextState currentState ev)])
    (cond [ (not (equal? newState 0))
            (set! currentState newState)
           (outputCurrentState)
           (printf "new state ~a\n"  currentState)
           ])
    )
  ))

;(outputCurrentsState)
;(gotoNextState "a")



;(define check (λ ()
                ;(cond
               ;   ((equal? (list-ref (hash-ref lightStates 2) 5) 1) cons1)
                 ; ((equal? (list-ref (hash-ref lightStates 2) 5) 1) cons2)
                ;  ((equal? (list-ref (hash-ref lightStates 10) 1) 1) cons3)
                 ; ((equal? (first(hash-ref lightStates 3)) 1) clear)
                  
                ;  (#t (displayln " BRAVO"))
              
                  
                ;  )))

(define co1 (thread cons1))

;(define test (λ ()
           ;    (cond
            ;     ((equal? currentState 11) co1)
             ;    ((not(equal? currentState 11)) kill-thread co1)
              ;   )))
                 


(define loop (λ ()
               (gotoNextState "b")
               (sleep 1)
               (gotoNextState "b")
               (sleep 1)
               (gotoNextState "b")
               (sleep 1)
               (sleep 10)
               (loop)
               ))

(setup)
(outputCurrentState)


(on-button-pressed step-button-pin (lambda () (printf "press ~s ~n" currentState) (gotoNextState "b")))
(on-button-pressed emergency-button-pin (lambda () (gotoNextState "e")))
