#lang racket


(define list1 '(a b c d e f))

(define list2 '(1 2 3 4 5 6))




(define my-third (λ ()
                   (third list1)))

(define my-last (λ ()
                    (last list1)))



(define my-first (λ ()(first list1)))

(define one (λ ()
                  (my-first)))






(define n (length list2))
(define f (first list2))

(define tricky (printf "~a ~a" n f))


                 
;(define LHrest (λ () (- (list2)(last list2))))



(define list3 '(a b c d e f e))

(define tricky1 (λ ()
                (reverse (rest (reverse list3)))))









                
                
                




