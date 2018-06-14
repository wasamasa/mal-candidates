(defvar t0 (time-usec))

(defun read-word (prompt)
  (format t "~a" prompt)
  (flush-stream)
  (get-line))

(defun read-words (prompt)
  (build
   (whilet ((word (read-word prompt)))
     (add word))))

(defun the-answer ()
  (+ (expt 3 3) (* 3 3) 3 3))

(defun make-greeter (target)
  (lambda () (format t "Hello ~a!\n" target)))

(defun hostname ()
  (with-stream (in (open-file "/etc/hostname"))
    (get-line in)))

(defun argv ()
  *args*)

(defex custom error)

(defun fail-gracefully ()
  (catch (throw 'custom 42)
    (custom (arg) (list 'custom arg))))

(defun splat (op ops)
  (apply op ops))

(defun tokenize (input)
  (mapcar 'trim-str (tok-str input #/ *([+\-*/()]|[0-9]+)/)))

(defun keys (dict)
  (hash-keys dict))

(defstruct (rect size) nil (size 0))

(defun now ()
  (tree-bind (t0-sec . t0-usec) t0
    (tree-bind (t1-sec . t1-usec) (time-usec)
      (+ (* (- t1-sec t0-sec) 1000)
         (/ (- t1-usec t0-usec) 1000.0)))))
