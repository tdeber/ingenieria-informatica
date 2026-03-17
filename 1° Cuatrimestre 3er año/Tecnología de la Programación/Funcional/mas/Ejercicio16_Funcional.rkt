#lang racket
(define v 'prueba)
(define l '(esto es una))

(define (attach-at-end v l)
  (if(null? l)
     (list v)
     (cons (car l) (attach-at-end v (cdr l)))
     ))

(display (attach-at-end v l))