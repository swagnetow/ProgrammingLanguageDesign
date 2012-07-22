(define line
  (lambda (n)
    (if (= n 0)
      (newline)
      (begin (display "*") (line (- n 1))))))

(define (histogram n)
  (if (null? n)
    (newline)
    (begin (line (car n)) (histogram (cdr n)))))
