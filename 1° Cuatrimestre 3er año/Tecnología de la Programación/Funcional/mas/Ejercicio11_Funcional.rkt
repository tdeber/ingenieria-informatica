#lang racket

(define (count-elem x l1)
  (if (null? l1)
      0
      (if (not (= x (car l1)))
          (count-elem x (cdr l1))
          (+ 1 (count-elem x (cdr l1))
          ))))

 (count-elem 3 '(1 2 3 4 5 4 3 2 1 ))