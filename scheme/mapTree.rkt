#lang sicp
;要遍历一棵树,须得走三步
;查看是否走到了最底层(null?),这是递归结束标志
;查看是否走到了叶子,每个叶子是数值,需要仔细对待
;都不是,就对树的第一个枝子进行递归,然后合并上对后面的枝子进行的递归值
(define (map-tree pric tree)
  (cond ((null? tree) nil)
        ((not (pair? tree))
         (pric tree))
        (else
         (cons (map-tree pric (car tree))
               (map-tree pric (cdr tree))))))
;scheme提供了一个更一般的map,传入一个n个参数的过程,和n个表,将这个过程应用于所有表的第一个元素,然后第二个,直到返回所有表
(define (map-squre-tree squre tree)
  (map (lambda(sub-tree)
         (if (pair? sub-tree)
             (map-squre-tree squre sub-tree)      ;第一个错,我用了(cdr sub-tree).要记住,在map里只要考虑一次参数计算就好,不用考虑递归. map已经完成递归了
             (squre sub-tree)))                   ;第二个错,是没用sub-tree,用的tree .要记住,lambda函数要用自己的形参.
       tree))

(define x (list (list 1 2) (list 3 4)))
(define (squre x )
  (* x x))

;(map-tree squre x)
(map-squre-tree squre x)