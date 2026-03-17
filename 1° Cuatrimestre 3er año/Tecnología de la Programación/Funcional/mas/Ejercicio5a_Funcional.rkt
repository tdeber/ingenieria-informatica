#lang racket
#|
(let [(a 1) (b 1)]
  (+
   (let [(a a) (b b)]
     (/ (* 7 a) b))
   (let [(a a) (b b)]
     (/ (* 3 a) b))
   (let [(a a) (b b)]
     (/ (* 7 a) b))))
|#

(let[(exp1 (/ (* 7 1) 1)) (exp2 (/ (* 3 1) 1))]
  (+ exp1 exp2 exp1))
