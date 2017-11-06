#lang racket

(require web-server/servlet
         web-server/servlet-env)

(require file/sha1)
(require net/base64)

(define root (path->string (current-directory)))

; path to the passwd file:
(define passwd-file (string-append root "/passwd"))

(define (any? pred list)
  ; returns true iff any element matches pred:
  (match list
    ['()  #f]
     [(cons hd tl)
     (or (pred hd) (any? pred (cdr list)))]))

; a password checking routine:
(define (htpasswd-credentials-valid?
         passwd-file
         username
         password)
  ; checks if the given credentials match those in the database
  ; it assumes all entries as SHA1-encoded as in `htpasswd -s`.

  ; read in the lines from the password file:
  (define lines (call-with-input-file passwd-file 
                  (λ (port) (port->lines port))))
  
  ; convert the password to sha1:
  (define sha1-pass (sha1-bytes (open-input-bytes password)))
  
  ; then to base64 encoding:
  (define sha1-pass-b64 
    (bytes->string/utf-8 (base64-encode sha1-pass #"")))
  
  ; check if both the username and the password match:
  (define (password-matches? line)

      (define user:hash (string-split line ":"))
      
      (define user (car user:hash))
      (define hash (cadr user:hash))
      
      (match (string->list hash)
        ; check for SHA1 prefix
        [`(#\{ #\S #\H #\A #\} . ,hashpass-chars)
         (define hashpass (list->string hashpass-chars))
         (and (equal? username (string->bytes/utf-8 user)) 
              (equal? hashpass sha1-pass-b64))]))
  
  ; check to see if any line validates:
  (any? password-matches? lines))


(define (req->user req)
  ; extracts the user for this request
  (match (request->basic-credentials req)
    [(cons user pass)   user]
    [else               #f]))

(define (authenticated? req)
  ; checks if a request has valid credentials:
  (match (request->basic-credentials req)
    [(cons user pass)
     (htpasswd-credentials-valid? passwd-file user pass)]
    
    [else     #f]))

(define (hello-servlet req)
  
  (cond
    ; check for authentication:
    [(not (authenticated? req))
     (response
      401 #"Unauthorized" 
      (current-seconds) 
      TEXT/HTML-MIME-TYPE
      (list
       (make-basic-auth-header
        "Authentication required"
        ))
      void)]
    
    ; if authenticated, serve the page:
    [else
     (response/xexpr
      #:preamble #"<!DOCTYPE html>"
      `(html
        (head)
        (body
         (p "Hello, " ,(bytes->string/utf-8 (req->user req)) "!"))))]))


(serve/servlet hello-servlet
               #:servlet-regexp #rx"")