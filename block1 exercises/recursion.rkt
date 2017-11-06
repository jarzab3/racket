#lang racket

(define rev1 (λ (x)
               (cond
                 ((empty? x) x)
                 (#t (rev1 (cons (rest x)(first x)))))))

(define/match (rev l)
  [('()) '()]
  [((list a ... b)) (cons b (rev a))])


(define (x y z)
  (cond
    ((null? y) z)
      (#t(x (cdr y) (cons (car y) z)))))

(define (w y)
  (x y '()))




    (define (what number)
      (if (zero? number)
          0
          (+ number (what (sub1 number)))))


    (define (count-down-from number)
      (if (zero? number)
          'done 
          (begin 
            (display (string-append (number->string number) " ")) ; [1]
            (count-down-from (sub1 number))                       ; [2]
          )
      )
    )