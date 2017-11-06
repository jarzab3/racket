
#lang racket

(require db)



(define sqlc

(mysql-connect	 	#:user "jarzab3cx"	 	 	 	 
 	 	#:database "jarzab3cx"	 	 	 	 
 	 	#:server "sql.jarzab3cx.nazwa.pl"	 	 	 
 	 	#:port 3306
                 #:password ""))

(require web-server/servlet
         web-server/servlet-env)

(require net/uri-codec)

(define (form-servlet req)
  
  (define uri (request-uri req))
  (define path (map path/param-path (url-path uri)))    
  (define page (car path))
  
  (cond 
    
    ; /form
    [(equal? page "form")
     (response/xexpr
      `(html
        (body

          <img src="MDX-logo.jpeg" alt="text">

          
         (form ([method "POST"] [action "/print-form-data"])

               
               "user name: " (input ([type "text"] [name "user"]))
               
               (br)
               "comment: " (input ([type "text"] [name "comment"]))
               (br)
               
               (input ([type "submit"]))))))]
    
    ; /print-form-data
    [(equal? page "print-form-data")
  
     ; extract the form data:
     (define post-data (bytes->string/utf-8 (request-post-data/raw req)))
     
     ; convert to an alist:
     (define form-data (form-urlencoded->alist post-data))

     ; pull out the user and comment:
     (define name    (cdr (assq 'user form-data)))
     (define comment (cdr (assq 'comment form-data)))
     
     ; send back the extracted data:
     (response/xexpr
      `(html
        (body
         (p "Your name: " ,name)
         <br>
         <br>
         <br>
         (p "You comment: " ,comment))))]
    
    ; another page?
    [else
     (response/xexpr
      `(html
        (body
         (p "Page not found!"))))]))
         
(serve/servlet form-servlet
               #:servlet-regexp #rx""
               #:servlet-path "/form")