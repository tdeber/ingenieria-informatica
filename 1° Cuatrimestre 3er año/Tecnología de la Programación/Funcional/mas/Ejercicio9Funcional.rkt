#lang racket

(define x '( 1 1))
(define y '( 2 2))

(define (distance2d x y)
  (sqrt(+ (expt (- (car y) (car x) ) 2)
          (expt (- (car (cdr y)) (car (cdr x)) ) 2)
          )))

(distance2d '(1 1) '(2 2))