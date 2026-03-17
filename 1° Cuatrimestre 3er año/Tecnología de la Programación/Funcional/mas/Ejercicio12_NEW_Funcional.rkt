#lang racket

(define l1 '(c o c o n u t ))

(define(subst a b l1)
  (if (null? l1)
      '()
      (if (equal? a (car l1))
          (cons b (subst a b (cdr l1)))
          (cons (car l1) (subst a b (cdr l1)))
          )))

(display (subst 'c 'k l1))