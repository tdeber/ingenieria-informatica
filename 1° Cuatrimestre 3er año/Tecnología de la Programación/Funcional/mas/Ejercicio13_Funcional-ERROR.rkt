#lang racket

(define (count-atomo lista atomo)
  (if (null? lista)
      0
      (if (eq? atomo (car lista))
          (+ 1 (count-atomo (cdr lista) atomo))
          (count-atomo (cdr lista) atomo))))

(define (generar-list atomo lista)
  (if (= (count-atomo lista atomo) 0)
      '()
      (cons atomo (generar-list atomo ( - (count-atomo lista atomo) 1)))
      ))

(define (borrar lista atomo)
  (if (null? lista)
      '()
      (if (eq? atomo (car lista))
          (borrar (cdr lista) atomo)
          (cons (car lista) (borrar (cdr lista) atomo)))))

(define (generar lista)
  (define(aux lista)
    (if(null? lista)
       '()
       (let ((atomo (car lista)))
          (cons (generar-list atomo lista)
                (aux (borrar lista atomo))))))
  (aux lista)
  )

(generar '(A A B C A B A D C))