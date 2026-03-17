#lang racket



(let ([a 1] [b 1])
  (let ([val1 (/ (* 7 a) b)][val2 (/ (* 3 a) b)])
    (+ val1 val2 val1)))


(let ([a 1][b 1][c 1])
  (let([L (list a b c)])
    (cons (car L) (cdr L))))