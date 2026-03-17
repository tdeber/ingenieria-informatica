#lang racket


(define (mascorta lista1 lista2)
  (cond
    [(< (length lista1) (length lista2)) lista1]
    [(> (length lista1) (length lista2)) lista2]
    [else lista1]
    )
  )

(mascorta '(a b c) '(d e))      ; Retorna '(d e)
(mascorta '(a b) '(d e f))      ; Retorna '(a b)
(mascorta '(a b c) '(d e f))    ; Retorna '(a b c)
     
