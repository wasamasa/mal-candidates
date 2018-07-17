;; -*- lexical-binding: t; -*-

(defun read-words (prompt)
  (let (words done)
    (while (not done)
      (let ((word (ignore-errors (read-from-minibuffer prompt))))
        (if word
            (push word words)
          (setq done t))))
    (nreverse words)))

(defun the-answer ()
  (+ (* 5 8) 2))

(defun make-greeter (name)
  (lambda () (format "Hello %s!" name)))

(defun hostname ()
  (with-temp-buffer
    (insert-file-contents "/etc/hostname")
    (replace-regexp-in-string "[[:space:]]$" "" (buffer-string))))

(defun argv ()
  argv)

(define-error 'mal-error "MAL error")

(defun fail-gracefully ()
  (condition-case err
      (signal 'mal-error "Test")
    (mal-error err)))

(defun splat (op args)
  (apply op args))

(defun tokenize (input)
  (let (tokens)
    (with-temp-buffer
      (insert input)
      (goto-char (point-min))
      (while (not (eobp))
        (if (looking-at "[[:space:]]*\\([-()+*/]\\|[[:digit:]]+\\)")
            (let ((token (match-string 1)))
              (push token tokens)
              (goto-char (match-end 0)))
          (push (buffer-substring (point) (point-max)) tokens)
          (goto-char (point-max)))))
    (nreverse tokens)))

(defun keys (dict)
  (let (keys)
    (maphash (lambda (k _v) (push k keys)) dict)
    keys))

(defun now ()
  (* (float-time) 1000))

(defun rect (size)
  (vector 'rect size))

(defun rect-size (r)
  (aref r 1))

(defun rect-size-set! (r size)
  (aset r 1 size))

(provide 'util)
