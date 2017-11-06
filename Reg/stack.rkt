#lang racket




(struct reg (name surname number))

(define st1 (reg 'Adam 'Jarzebak' 525614))

(define st2 (reg 'Carlos 'Bethi 434323))

(define st3 (reg 'Marcini 'Gothe 543432))

(define st4 (reg 'Fraino 'Buttlo 544398))

(define st5 (reg 'Wresso 'Kareex 543653))

(define allstudents (list st1 st2 st3 st4 st5))



























(struct stack (list))

(define (make-stack)(stack'()))

(define list->stack stack)

(define stack->list stack-list)

(define empty-stack? (compose null? stack-list))

(define size (compose length stack-list))

(define top (compose car stack-list))

(define pop (compose stack cdr stack-list))

(define (push s el)(stack (cons el (stack-list s))))

