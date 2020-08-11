#lang sicp
(define (scale-list n items )
  ( if (null? items)
       nil
       (cons (* n (car items))
             (scale-list n (cdr items)))))

(define (map p l)
  (if (null? l)
      nil
      (cons (p (car l))
            (map p (cdr l)))))
(define (map-fast p l c)
  (if (null? l)
      c
      (map-fast p (cdr l) (cons c (p (car l)) ))))


(define (scale-list2 n items)
  (map-fast (lambda(x)(* x n)) items nil))

(scale-list2 10 (list 1 2 3 4))

