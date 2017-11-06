#lang racket



(define bag1 '(apples (grapes) (melon cabbage)))



(define bag2 '(chocolate (cream cakes) sugar))



;1  (first (rest bag1)) 

;2  (cons 'pears bag1)

;3  (first (first (rest bag1)))

;4  (cons '(raisins sultanas) bag2)

;5  (append bag1 bag2)

;6  (append '(raisins sultanas) bag2)

;7  (list 'bag1 'bag2)

;8  (list bag1 bag2)

;9  (list (first (first (rest (rest bag1)))) (first bag2))

;10 (reverse bag1)

;11 (reverse bag2)

;12 (first (cons 'pears bag1))


(define rev (λ (l)
              (