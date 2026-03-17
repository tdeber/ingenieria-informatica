#lang racket
#|El procedimiento length retorna la longitud de su argumento, que debe ser una lista. Por ejemplo,
(length '(a b c)) es 3. Usando length, defina el procedimiento mascorta, que retorna la lista
más corta de los dos argumentos pasados o la primera lista si tienen el mismo largo.
|#

(define l1 (list 1 2 3 4))
(define l2 (list 1 2))

(define (mascorta l1 l2)
  (if (> (length l1) (length l2))
      l2
      (if (< (length l1) (length l2))
          l1
          l1)))
