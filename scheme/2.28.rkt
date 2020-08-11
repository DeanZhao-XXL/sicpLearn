#lang sicp
;2.28 把树转成表
;遍历树,找到叶子,把叶子list起来
(define (fringe tree)
  (cond ((null? tree) nil)
        ((not (pair?  tree)) (list tree))      
        (else
          (append (fringe (car tree))
                (fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))

;用append , 那么叶子时,要返回 list tree ,不然会报错.

;写一遍append. 虽然scheme里面有
(define (append list1 list2)
  (if (null? list1)
      list2 ;如果list1为空,那么就返回list2
      (cons (car list1 )(append (car list1) list2))))
;不然就先计算出cdr list1 和 list2 的cons
;最后就变成了(cons 1 (cons 2 (cons 3 ...(cons n list2)
;就等于把list1 拆散了,一个个的cons到list2上
