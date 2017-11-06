#lang racket

(define h (hash
           1 '(1 2 3 4)
           2 '(a b c d)
           3 '(5 6 7 8)
           ))


(pretty-format "awdwa" 3223
                #:mode 'display)



(define lop1 (λ()
              (displayln "111")
              (sleep 2)
              (displayln "2222")
              (sleep 2)
              (lop1)
              
              ))

(define lop (λ()
              (displayln "444")
              (sleep 2)
              (displayln "5555")
              (sleep 2)
              (lop)
              
              ))
(define  th1 (λ
                 ()
               (thread lop1 )))

(define  th (λ
                 ()
               (thread lop )))









