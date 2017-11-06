#lang racket

(require web-server/servlet
         web-server/servlet-env)

(define
  (myresponse request)
  (define bindings (request-bindings request))
  
  (cond
    ((exists-binding? `na bindings)
     
     (define myname (extract-binding/single `na bindings))
     
     
     
     (response/xexpr
      
      `(html (head
              (title "Attendance Submited!")
              
              (link ([rel "stylesheet"] [type "text/css"] [href "/style.css"]))
              (script ([type "text/javascript"] [src "/java.js"]))
              
              )
             
             (body
              (h1 "Submited")
              
              (div ((class "na"))
                   
                   (p "Hi " ,myname)
                   )
              (p )
              
              
              ))))
    
    (else
     
     
     (response/xexpr
      `(html (head
              (title "Attendance")
              
              
              (link ([rel "stylesheet"] [type "text/css"] [href "/style.css"]))
              (script ([type "text/javascript"] [src "/java.js"]))
              )
             
             (body
              
              
              (h1 "Please enter your ID number!")
              
              (form
               
               (br)
               (br)
               (input ((name "na")))
               (br)

               
               (input ((type "submit") (value "Submit") ))
               
               )
              ))))
    
    ))

(serve/servlet myresponse)
