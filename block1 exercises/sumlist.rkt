#lang racket

(define a1 '(3 4 6 2))


(define a '( (expt 23 2)(23)(24)))


( define sumlist (λ (x)
                   ( cond
                      ((not (number? x))(displayln "Please Input Number"))
                      (( null? x) 0)
                      (#t (+ (first x) ( sumlist ( rest x )))))))


( define remove-if (λ ( test x)
                     ( cond
                        ((not (number? x))(displayln "Please Input Number"))
                        (( empty? x) '())
                        (( test ( first x)) ( remove-if test ( rest x)))
                        (#t ( cons ( first x) ( remove-if test ( rest x )))))))