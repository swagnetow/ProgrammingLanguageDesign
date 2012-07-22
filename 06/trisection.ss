(define disp
  (lambda (x n)
    (display (/ (round (* x (expt 10 n))) (expt 10 n)))))

(define fmax
  (lambda (f x1 x2)
    (cond
      ((< (- x2 x1) 1e-10)
       (display "Maximum:  f(")
       (disp (/ (+ x1 x2) 2) 6)
       (display ") = ")
       (disp (f (/ (+ x1 x2) 2)) 6))
      (else (let ((a1 (+ x1 (/ (- x2 x1) 3)))
                  (a2 (- x2 (/ (- x2 x1) 3))))
              (if (< (f a1) (f a2))
                (fmax f a1 x2)
                (fmax f x1 a2)))))))
