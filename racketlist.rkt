#lang racket


(define toSort (list 2 5 9 22 8 3 4 3 123 14))

(define l2 (list 5 5 9 22 8 3 4 3 123 14))


( define sumlist (λ (x)
                   ( cond
                      ;((not (number? x))(displayln "Please Input Number"))
                      (( null? x) 0)
                      (#t (+ (first x) ( sumlist ( rest x )))))))


(define temp 0)
(define current 0)

(define ass
  (λ (lis pos)
    (for ([i lis])
      (cond
        ((empty? lis) '())
        ((equal? i pos) (set! current i))
        (#t
         (printf "~s \n" i)))
      )
displayln current
    display lis(pos)
    ))



(define sorting (λ (lis pos)
                  (for ([i lis])
                    (cond
                      ;                    ((null? x) 0)
                      (( empty? lis) '())
                      ))))
;(#t (+ (

