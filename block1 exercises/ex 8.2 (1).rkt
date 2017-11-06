#lang racket


(define test (λ(x)
               (cond
                 ((number? x) (* x 2))
                 ((string? x) x x)
               
                 ((#t "not working")))))





(define test1 (λ(x)
               (cond
                 ((number? x) (* x 2))
                 ((string? x) (string-append x x))
               
                 ((#t "not working")))))

;what could be else if not number or strings ???



( define double (λ (x)
                    (cond
                      ((real? x) (* x 2))
                      ((string? x) (printf "~a ~a" x x) )
                      ( #t "Input Error"))))