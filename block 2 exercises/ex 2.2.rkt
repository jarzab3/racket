#lang racket
(require racket/date)

(struct film (title director duration))

(define legend (film 'legend 'robinson 120))

(define check (λ (x)
                (cond
                 ((equal? x 'sam ) (film-title legend))
                 ("not by someone"))))

(define un (λ (x)
             (cond
               ((equal? film x) (film-title x))
               (not(film? x)
               ("not a film")))))

(define hes (hash
             0 '(2 3 4)
             1 '(f1 f2 f3)
             2 '(f1 f2 f3)
             ))
(define out (open-output-file "data.txt" #:exists 'truncate))

(define ch (λ ()
             (cond
     
             (displayln "111")
             (sleep 0.5)
             (displayln "222")
             (sleep 0.5)
             (ch)
             )))
  (define run (λ () thread ch))
  
(define ch1 (λ ()
     
             (displayln "111")
             (sleep 0.5)
             (displayln "222")
             (sleep 0.5)
             (ch)
             ))

