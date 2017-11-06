#lang racket
(require racket/gui/base)




(define frame (new frame% [label "Example"]))




(send frame show #t)

(define s (λ (x)(sleep x)))
(define x 1)



(define loop (λ ()
               (displayln "111")
               (s x)
               (displayln "222")
               (s x)
               (loop)))

(new control-event%	 
   	 	[event-type slider%]	 
 	[time-stamp 2])


;(define interested 1)

(define (person) (λ (i)
          (let ([interested 1][not-interested 0])
            (cond
              ((equal? person interested) displayln "above inf valid")
              ((equal? person not-interested) displayln "ignore this post")
              (#t (displayln "ignore it"))))))

(define (g x)
    (define a 1)
    (+ a x))
(define (f x)
  (let ((a 1))
    (+ a x)))



