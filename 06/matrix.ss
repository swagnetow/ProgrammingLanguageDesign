; Display component of the vector

(define (display-vector v)
  (do ((i 0 (add1 i)))
      ((>= i (vector-length v)) (display ""))
      (display (vector-ref v i)) (display " ")))

; Read from file and return a matrix

(define (read-matrix filename)
  (let* ((inport (open-input-file filename))
         (nrow (read inport))
         (ncol (read inport))
         (mat (make-vector nrow)))
        (do ((i 0 (add1 i)))
            ((>= i nrow) (close-input-port inport) mat)
            (let ((row (make-vector ncol)))
              (do ((j 0 (add1 j)))
                  ((>= j ncol) (vector-set! mat i row))
                  (vector-set! row j (read inport)))))))

; Return i-th row of the matrix in filename

(define (ro filename i)
  (define mat (read-matrix filename))
  (vector-ref mat (- i 1)))

; Display i-th row of the matrix in filename

(define (row filename i)
  (display-vector (ro filename i)))

; Return j-th col of the matrix in filename

(define (co filename j)
  (define mat (read-matrix filename))
  (define nrow (vector-length mat))
  (define column (make-vector nrow))
  (do ((i 0 (add1 i)))
    ((>= i nrow) column)
    (vector-set! column i (vector-ref (vector-ref mat i) (- j 1)))))

; Display j-th col of the matrix in filename

(define (col filename j)
  (display-vector (co filename j)))

; Return the dot product v1 * v2

(define (dot-product v1 v2)
  (do ((i 0 (add1 i)) (sum 0 (+ sum (* (vector-ref v1 i)
                                       (vector-ref v2 i)))))
  ((>= i (vector-length v1)) sum)))

; Matrix multiplication, display and create f3

(define (mmu1 f1 f2 f3)
  (define m1 (read-matrix f1))
  (define m2 (read-matrix f2))
  (define nrow (vector-length m1))
  (define ncol (vector-length m2))
  (define outport (open-output-file f3))
  (display nrow outport) (display " " outport)
  (display ncol outport) (newline outport)
  (do ((i 0 (add1 i)))
      ((>= i nrow) (close-output-port outport) (display ""))
      (let ((row (make-vector ncol)))
      (do ((j 0 (add1 j)))
          ((>= j ncol) (display-vector row) (newline) (newline outport))
          (vector-set! row j (dot-product (ro f1 (add1 i)) (co f2 (add1 j))))
          (display (vector-ref row j) outport) (display " " outport)))))
