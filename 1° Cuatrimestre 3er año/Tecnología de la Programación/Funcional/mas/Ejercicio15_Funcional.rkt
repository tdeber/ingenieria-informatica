#lang racket

(define l1 '((1 . 2) 'a (b) (5) 6 8 'a 9 ))

(define (primer-num l1)
  (if(null?  l1)
     null
     (if (number? (car l1))
         (car l1)
         (primer-num (cdr l1))
         )))

(display (primer-num l1))