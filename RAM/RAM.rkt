#lang racket

(require racket/gui)

(require "AsipMain.rkt")

(define leds (list 23 24 25 26 27 28 29 30))
(define d-input (list 34 35 36 37 38 39 40 41))
(define a-input (list 46 47 48 49))



(define setup
  (λ ()    
  (open-asip)
    
    (map (λ (x) (set-pin-mode  x OUTPUT_MODE)) leds)
    
    (map (λ (x) (digital-write x LOW)) leds)

    (map (λ (x) (set-pin-mode  x  OUTPUT_MODE)) a-input)
    
    (set-pin-mode 3 OUTPUT_MODE)

    ;(r)
    
    ))


(define clear (λ ()  (map (λ (x) (digital-write x LOW)) leds)))




(define fun (λ (x)(- (char->integer x) 48)))


(define window1 (new frame%
                     [label "Program"]
                     [width 350] [height 250]  [alignment '(center center)] ))

(define window2 (new frame%
                     [label "READ DATA"]
                     [width 350] [height 250]  [alignment '(center center)] ))


(define panel1 (new vertical-panel% [parent window1][alignment '(center top)] [vert-margin 15]
                    [horiz-margin 0] [stretchable-width #f][stretchable-height #f]))

(define panel2 (new vertical-panel% [parent window1][alignment '(center top)][vert-margin 100]
                    [horiz-margin 0]))

(define panel3 (new vertical-panel% [parent window2][alignment '(center top)] [vert-margin 15]
                    [horiz-margin 0] [stretchable-width #f][stretchable-height #f]))

(define panel7 (new vertical-panel% [parent window1][alignment '(center bottom)][vert-margin 15]
                    [horiz-margin 0]))

(define panel4 (new vertical-panel% [parent window2][alignment '(center top)][vert-margin 50]
                    [horiz-margin 0]))

(define panel5 (new vertical-panel% [parent window2][alignment '(center center)][vert-margin 0]
                    [horiz-margin 0]))

(define panel6 (new vertical-panel% [parent window2][alignment '(center bottom)][vert-margin 50]
                    [horiz-margin 25]))



(define canvas1
  (new canvas% [parent panel1]
       [style '(transparent) ]
       [stretchable-width #f][stretchable-height #f]
       [min-width 130] [min-height 35]
       [paint-callback
        (lambda (canvas dc)
          (send dc set-scale 1 1)
          (send dc set-text-foreground "black")
          (send dc draw-text "TEST RAM" 25 10)
          (send dc get-text-extent "TEST RAM"))]))


(define canvas2
  (new canvas% [parent panel1]
       [style '(transparent) ]
       [stretchable-width #f][stretchable-height #f]
       [min-width 185] [min-height 40]
       [paint-callback
        (lambda (canvas dc)
          (send dc set-scale 1 1)
          (send dc set-text-foreground "black")
          (send dc draw-text "MANUAL CONTROL" 25 10)
          (send dc get-text-extent "MANUAL CONTROL"))]))


(define canvas3
  (new canvas% [parent panel3]
       [style '(transparent) ]
       [stretchable-width #f][stretchable-height #f]
       [min-width 150] [min-height 40]
       [paint-callback
        (lambda (canvas dc)
          (send dc set-scale 1 1)
          (send dc set-text-foreground "black")
          (send dc draw-text "READ DATA" 25 10)
          (send dc get-text-extent "READ DATA"))]))



(define cv void);current
(define f1 '()) ;value from text-field1
(define ff1 '())
(define f2 '())
(define ff2 '())


(define tf1
(new text-field%	 
     [label "DATA INPUT"]
     [init-value ""]
     [parent panel2]
     [min-width 50]
     [stretchable-width #f][stretchable-height #f]
     [style '(single vertical-label)]  
     [callback (λ (t e) 
                (cv)
                 )]))

(define tf2
(new text-field%	 
     [label "ADDRESS"]
     [init-value ""]
     [parent panel2]
     [min-width 50]
     [stretchable-width #f][stretchable-height #f]
     [style '(single vertical-label)]  
     [callback (λ (t e) 
                (cv)
                 )]))


(define tf3
(new text-field%	 
     [label "DATA"]
     [init-value ""]
     [parent panel6]
     [min-width 50]
     [stretchable-width #f][stretchable-height #f]
     [style '(single vertical-label)]  
     [callback (λ (t e) 
                (cv)
                 )]))


(define tf4
(new text-field%	 
     [label "ADDRESS"]
     [init-value ""]
     [parent panel4]
     [min-width 50]
     [stretchable-width #f][stretchable-height #f]
     [style '(single vertical-label)]  
     [callback (λ (t e) 
                (cv)
                 )]))



(define but1
  (new button% [ parent panel2]
       [label "Send Data"]
       [ callback (λ (b e)
                    (map (λ (x) (set-pin-mode  x  OUTPUT_MODE)) d-input)
                    (cond

                      ((not(number? (string->number (send tf1 get-value)))) 
                       (message-box "ERROR" "Please enter correct data (0 or 1)" #f '(ok)))
                      ((not(= (string-length (send tf1 get-value)) 8))
                       (message-box "ERROR" "Please enter 8 bit data" #f '(ok)))
                      
                      ((not(number? (string->number (send tf1 get-value))))
                       (message-box "ERROR" "Please enter correct address (0 or 1)" #f '(ok)))
                      ((not(= (string-length (send tf2 get-value)) 4))
                       (message-box "ERROR" "Please enter 4 bit address" #f '(ok)))                  
                      
                      (#t
                       ;;;;; settings for data
                      (set! f1 (send tf1 get-value))                  
                      (send tf1 set-value "")
                      (set! ff1 (map fun (string->list f1)))
                      (push ff1 d-stack)
                      
                      ;;;;;settings for address
                                        
                      (set! f2 (send tf2 get-value))
                      (send tf2 set-value "")
                      (set! ff2 (map fun (string->list f2)))
                      (push ff2 a-stack)
          
                      (map (λ (x) (set-pin-mode  x  OUTPUT_MODE)) d-input)
                      (w)
                      (w-a)
                      (w-d)
                      
                      (message-box "Submited" "Thanks, your data has been saved!" #f '(ok))
                      (dis-leds)
                      (r)
                      )
                      )

                      )]))


(define but2
  (new button% [ parent panel7]
       [label "OPEN DATA READER"]
       [ callback (λ (b e)
                    (send window2 show #t))]))


(define but3
  (new button% [ parent panel5]
       [label "GET A DATA"]
       [ callback (λ (b e)
                    
                    (map (λ (x) (set-pin-mode  x  INPUT_MODE)) d-input)
                    (r)
                    (set! f2 (send tf4 get-value))
                    (send tf4 set-value "")
                    (set! ff2 (string->list f2))
                    (set! ff2 (map fun ff2))                               
                    (w-a)
                    
                    ;;;;
                    
                    (map (λ (x) (set-pin-mode  x  INPUT_MODE)) d-input)
                    
                    (send tf3 set-value (string-join (map ~a (map digital-read d-input)) ""))

                     
                    
              )]))



(define a-stack (box '()))

(define d-stack (box '()))


(define (push x stack)
  (set-box! stack (cons x (unbox stack))))

(define (pop stack)
  (let ((result (first (unbox stack))))
    (set-box! stack (rest (unbox stack)))
    result))



(define test (λ ()
(map (λ (n)
         (cond
           ((equal? n 0) (printf "~s " n))
           ((equal? n 1) (printf "~s " n))
           ))
       ff1)
))

(define dis-leds (λ ()
(map (λ (n c)
         (cond
           ((equal? n 0) (digital-write c LOW))
           ((equal? n 1) (digital-write c HIGH))
         ))
     ff1 leds)))

(define w-d (λ ()
(map (λ (v c)
         (cond
           ((equal? v 0) (digital-write c LOW))
           ((equal? v 1) (digital-write c HIGH))
         ))
     ff1 d-input)))

(define w-a (λ ()
(map (λ (n c)
         (cond
           ((equal? n 0) (digital-write c LOW))
           ((equal? n 1) (digital-write c HIGH))
         ))
     ff2 a-input)))


(define r (λ ()
               (digital-write 3 HIGH)
               ))
(define w (λ ()
                (digital-write 3 LOW)
                ))


(send window1 show #t)

(setup)
