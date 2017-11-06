#lang racket

;;;;;;;;;1 and 2

(define  check (λ (x)
                      (cond
                          ((not (number? x))(displayln "Please Input Number"))
                          ((and (< x 300) (> x 90)) (displayln "Heavy"))
                          ((and (< x 90) (> x 60)) (displayln "Medium"))
                          ((and (< x 60) (> x 0))(displayln "Light"))
                          ((> x 300)( displayln "Wrong Input!"))
                          ((< x 0)(displayln "Value must be positive"))
                          )))



;;;;;;;;3



(define test (λ (L)
               (cond 
                 ((number? L)(* L 2))
                 (#T(not (number? L))(displayln L)))))
                  



;;;;;;;;4



(define test1 (λ (X Y)
                (cond
                  ((not(list? Y))(displayln "Y must be a list"))
                   ((list? X)(append X Y))
                    ((not(list? X))(cons X Y))
                    ((#t "ERROR")))))

                  
          

;;;;;;5





(define three (λ (x a b)
               (cond 
           
                 ((and (< a x)(< x b)) "yeah")
                 )
                 ))







