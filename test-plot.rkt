#lang racket
(require plot
         math
         "bestfit.rkt")

;(: 3x^2 : Nonnegative-Flonum -> Nonnegative-Flonum)
(define (3x^2 x) (* 3.0 (expt x 2.0)))

;(: apply-error : Nonnegative-Flonum -> Nonnegative-Flonum)
(define (add-error y) (+ y (* y (/ (- (random 4) 2) 10.0))))

(define exact (function 3x^2 #:label "exact" #:color "blue"))

(define-values (pts fit err)
  (graph/power (build-list 10 (compose fl add1))
               (build-list 10 (compose add-error 3x^2 fl add1))
               (build-list 10 (const 0.2))))

(plot (list exact fit pts err))
