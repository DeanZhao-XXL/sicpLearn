#lang sicp
;2.31 tree-map ,树的一般化抽象
(define (tree-map f tree)
  (cond ((null? tree) nil)
        ((not (pair? tree))
         (f tree))
        (else
         (cons (tree-map f (car tree))
               (tree-map f (cdr tree))))))

;利用map的另一种一般抽象
(define (tree-map-2 f tree)
  (map (lambda(sub-tree)
         (if (pair? sub-tree)
             (tree-map-2 sub-tree)    ;处理子树
             (f sub-tree)))           ;处理节点
       tree))








(define x (list (list 1 2) (list 3 4)))
(define (squre x )
  (* x x))