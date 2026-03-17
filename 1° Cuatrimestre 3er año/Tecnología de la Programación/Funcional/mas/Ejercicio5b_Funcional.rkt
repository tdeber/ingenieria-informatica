#lang racket

#|(cons (car (list a b c)) (cdr (list a b c)))
|#

(let [(a 1) (b 2) (c 3)]
  (let [(lst (list a b c))]
  (cons (car lst) (cdr lst)))
  )