#lang racket

(define l1 '( a b c . x))
(define l2 '(a b c x))
(define l3 '((a . x) b))
(define l4 '(x . a))
(define l5 '(a . x))

"1"
(cdr (cdr (cdr '(a b c . x))))
"2"
(last l2)
"3"
(cdr (car l3))
"4"
(car l4)
"5"
(cdr l5)