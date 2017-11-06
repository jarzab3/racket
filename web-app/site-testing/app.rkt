
#lang racket/base






(require db)


(define sp
  (build-path "D:/web"))






(require web-server/servlet
         web-server/servlet-env)


(require net/uri-codec)

(define (form-servlet req)
  
  (define uri (request-uri req))
  (define path (map path/param-path (url-path uri)))    
  (define page (car path))


  
  (cond 
    
    ; /form
    [(equal? page "app")
     (response/xexpr
      `(html
      `(head
		(title "RACKET" )
                
		(link ([rel "stylesheet"] [type "text/css"] [href "/style.css"]))

                (script ([type "text/javascript"] [src "/java.js"]))

                )
  
  
     

  
        (body

         (div ((id "header"))
         
         (h1 ((align "center")) "Attendance")
         )

      

          
         (form  ([method "POST"] [action "/print-form-data"])

               
            "user name:" (input  ([type "text"] [name "user"]))
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
    ; (define comment (cdr (assq 'comment form-data)))
     
     ; send back the extracted data:
     (response/xexpr
      `(html
    
        (body

           (div ((id "header"))
         
         (h1 ((align "center")) "Attendance")
         )

           (p ((id "dis")))

         (br)
         (br)
         (p "ksabkdaj")
        
           )
         
         ;(p ((align "center")) "Your name: " ,name)
))]
         
    ; another page?
    [else
     (response/xexpr
      `(html
        (body
         (p "Page not found!"))))]

    


    )
  )




(serve/servlet form-servlet
               #:launch-browser? #t
               #:servlet-regexp #rx""
               #:servlet-path "/app"
               #:listen-ip #f
               #:port 8080
               #:server-root-path
               "default-web-root"
               #:extra-files-paths
               (list (build-path "server-root-path" "htdocs"))
               #:servlets-root
               (build-path "server-root-path" "htdocs")
               #:servlet-current-directory
               "servlets-root"
               )
              
              
               
             

