(define sp-do
  (lambda (v1 v2)
    (cond ((= (vector-length v1) (vector-length v2))
            (let ((s 0))
              (do ((i 0 (add1 i)))
                  ((>= i (vector-length v1)) (display s))
                (set! s
                  (+ s (* (vector-ref v1 i) (vector-ref v2 i)))))))
          ((zero? (vector-length v1))
           (display "Error: empty vectors!"))
          (else (display "Error: different sizes of vectors!")))))

(define dot-product
  (lambda (v1 v2 n)
    (cond ((= 1 n) (* (vector-ref v1 0) (vector-ref v2 0)))
          (else (+ (* (vector-ref v1 (sub1 n))
                      (vector-ref v2 (sub1 n)))
                   (dot-product v1 v2 (sub1 n)))))))

(define sp-rec
  (lambda (v1 v2)
    (cond ((= (vector-length v1) (vector-length v2))
           (dot-product v1 v2 (vector-length v1)))
          ((zero? (vector-length v1))
           (display "Error: empty vector!"))
          (else (display "Error: different sizes of vectors!")))))
