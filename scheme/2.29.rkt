#lang sicp
;2.29


;活动体的总重量
;两个分支的重量
;两个分支的weight递归,直到weight不是pair
;(define (total-weight m)
  ;(define (weight b count)
     ;      (cond ((null? b) nil)
     ;            ((not(pair?  b))
     ;             (+ count (branch-weight  b)))
                 
     ;            (else
     ;             ( weight (branch-weight b ) count))))
 ; (+ (weight (left-branch m) 0)
 ;    (weight (right-branch m) 0)))

(define x (list (list 1 2) (list 3 4)))


;写的一团乱,还没有结果. 如果想真正使用好sicp,就要现在开始用答案里的思
;把构造函数写出来. 不要嫌麻烦,把参数名之类的写的有意义,好处多多
(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

;再写选择函数
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))        ;cadr就等于(car (cdr x)). 就是取后半截的第一个
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))


;(branch-structure (left-branch x))      branch-structure 是cadr时,返回2 , 是cdr时,返回 (2). 一个是可以加减的数字, 一个是list

;分析规则
;总重量是两个分支之和
;如果一个分支的structure是数字,那么重量就是这个数,不然就要计算structure的重量
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))   ;计算左右分支之和

(define (branch-weight branch)
  (if (hangs-another-mobile? branch)
      (total-weight (branch-structure branch))  ;我再这一步出错. 发现一个分支是structure时,需要对这个分支调用total-weight .而不是branch-weight
      (branch-structure branch)))

(define (hangs-another-mobile? branch)
  (pair? (branch-structure branch)))


;把需要的函数写全以后,再继续进行计算,就方便很多
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (mobile-balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and
     (same-torque? left right)
     (branch-balance? left)
     (branch-balance? right))))

(define (same-torque? left right)
  (= (branch-torque left)
     (branch-torque right)))

(define (branch-balance? branch)
  (if (hangs-another-mobile? branch)
      (mobile-balance? (branch-structure branch))
      #t))
               
               
               
           