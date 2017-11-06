#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define
  (myresponse request)
  
  (define bindings (request-bindings request))
    
    (cond
      ((exists-binding? 'name bindings)
       
       (define myname (extract-binding/single 'name bindings))
       
       (response/xexpr
        '(html (head (title))
               
               (body
                (h1 "simple")
                
                (div ((class "name"))
                     
                     (p "Hi" ,myname))))))
      
      (else
       
       (response/xexpr
        
        '(html (head (title "Simple Page"))
               (body
                (h1
                 "A Simpe Dynamic page"
                 )
                (form
                 (input ((name "name")))
                 
                 (input ((type "submit"
                               ))))))))))
       (serve/servlet myresponse)
       