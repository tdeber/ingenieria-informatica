#lang racket


(let [(a 1) (b 1)]
  (+
   (let [(a a) (b b)]
     (/ (let[(a a)]
          (* 7 a)) b))
   (let [(a a) (b b)]
     (/ (let[(a a)]
          (* 3 a)) b))
   (let [(a a) (b b)]
     (/ (let[(a a)]
          (* 7 a)) b))
   )
  )

