#lang racket

(require db)

(define vc
  (virtual-connection
   (λ ()
     (printf "connecting!\n")
     (mysql-connect
   #:user "jarzab3cx"
   #:database "jarzab3cx"
   #:server "sql.jarzab3cx.nazwa.pl"
   #:port 3306
   #:password "Racket123"))))
