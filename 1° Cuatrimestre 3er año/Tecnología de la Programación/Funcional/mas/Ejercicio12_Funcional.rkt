#lang racket

(define subst
  (lambda (a b l1)
    (if(null? l1)
       '()
       (if(eq? (car l1) a)
          (cons b (subst a b (cdr l1)))
          (cons (car l1) (subst a b (cdr l1)))))))

(subst 'c 'k '( c o c o n u t)) 