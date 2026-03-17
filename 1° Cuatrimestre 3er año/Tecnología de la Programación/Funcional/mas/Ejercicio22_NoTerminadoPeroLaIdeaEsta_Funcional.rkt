#lang racket

(define (JuntarLista X Y) (display "Juntada"))


(define (app2list X Y)
  (cond
    ((and (list? X) (list? Y)) (JuntarLista X Y))

    ((list? X) (cons X Y))

    ((list? Y) (cons X Y))

    (else (list X Y ))
    
  )
)

(displayln (app2list 2 3))