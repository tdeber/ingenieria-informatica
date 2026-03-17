#lang racket
(define l1 '(1 2 3 ))
(define l2 '(4 5 6 ))

(define (concatenar l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (concatenar (cdr l1) l2))))

(display (concatenar l1 l2))