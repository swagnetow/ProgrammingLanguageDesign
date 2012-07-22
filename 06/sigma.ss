(define (sum mlist)
  (if (null? mlist) 0 
  (+ (car mlist)
  (sum (cdr mlist)))))

(define (sigma . mean)
  (sqrt (- (/ (sum
    (map (lambda (n) (* n n)) mean))
    (length mean))
    (expt (/ (sum mean)
    (length mean)) 2))))
