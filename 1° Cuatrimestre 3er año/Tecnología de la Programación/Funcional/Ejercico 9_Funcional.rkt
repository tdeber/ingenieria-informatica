#lang racket

(define (distance2d p1 p2)

  (sqrt(+ (* (- (car p2) (car p1)) (- (car p2) (car p1))) (* (- (cdr p2) (cdr p1)) (- (cdr p2) (cdr p1) ) ) ) )

       )


(define x '(1 . 1))
(define y '(2 . 2))


(distance2d x y)
