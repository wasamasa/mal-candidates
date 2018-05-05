(defmacro comment (&rest body) nil)
(defmacro import (path) nil)

(defun println (fmt &rest args)
  (apply #'format (standard-output) (string-append fmt "~%") args))

(defun gets (prompt)
  (format (standard-output) prompt)
  (with-open-input-file (in "/dev/stdin")
    (read-line in nil)))

(defun read-words (prompt)
  (let ((words nil)
        (word nil))
    (while (setq word (gets prompt))
      (setq words (cons word words)))
    (nreverse words)))

(defun the-answer ()
  (- (* 5 9) 3))

(defun make-greeter (name)
  (lambda () (string-append "Hello " name "!")))

(defun hostname ()
  (with-open-input-file (in "/etc/hostname")
    (read-line in)))

(defun argv ()
  (with-open-input-file (in "/tmp/islisp_args")
    (println "Opened argv file")
    (let ((lines nil)
          (line nil))
      (while (setq line (read-line in nil))
        (println "Arg: ~S" line)
        (setq lines (cons line lines)))
      (nreverse lines))))

(defun fail-gracefully ()
  (block fail
    (with-handler
     (lambda (condition)
       (return-from fail (cons (simple-error-format-string condition)
                               (simple-error-format-arguments condition))))
     (error "Test" 42))))

(defun splat (op args)
  (apply op args))

(defun whitespacep (c) (or (char= c #\space) (char= c #\newline)))
(defun digitp (c) (and (char>= c #\0) (char<= c #\9)))
(defun specialp (c) (member c '(#\+ #\- #\* #\/ #\( #\))))

(defun list-to-string (chars)
  (let ((string (create-string (length chars)))
        (i 0))
    (while chars
      (setf (aref string i) (car chars))
      (setq i (1+ i))
      (setq chars (cdr chars)))
    string))

(defun read-whitespace (in)
  (let ((char nil))
    (while (and (setq char (preview-char in nil))
                (whitespacep char))
      (read-char in))))

(defun read-number (in)
  (let ((chars nil)
        (char nil))
    (while (and (setq char (preview-char in nil))
                (digitp char))
      (setq chars (cons (read-char in) chars)))
    (list-to-string (nreverse chars))))

(defun tokenize (input)
  (let ((in (create-string-input-stream input))
        (tokens nil)
        (char nil))
    (while (setq char (preview-char in nil))
      (cond
       ((whitespacep char)
        (read-whitespace in))
       ((digitp char)
        (setq tokens (cons (read-number in) tokens)))
       ((specialp char)
        (setq tokens (cons (create-string 1 (read-char in)) tokens)))
       (t (close in) (error "unknown char ~S" char))))
    (close in)
    (nreverse tokens)))

(defun keys (dict)
  (mapcar #'car dict))

(defun now ()
  (* (quotient (get-internal-run-time)
               (internal-time-units-per-second))
     1000))

(defclass <rect> ()
  ((size :accessor rect-size
         :initarg size)))

(defun create-rect (size)
  (create (class <rect>) 'size size))
