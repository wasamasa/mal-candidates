(require 'readline)

(defvar history-file (format "%s/.mal_history" (getenv "HOME")))

(defun blankp (line)
  (string-match-p "^[[:space:]]*$" line))

(defun load-history ()
  (with-temp-buffer
    (ignore-errors
      (insert-file-contents history-file))
    (goto-char (point-min))
    (while (not (eobp))
      (let ((line (buffer-substring (line-beginning-position)
                                    (line-end-position))))
        (when (not (blankp line))
          (add-history line)))
      (forward-line 1))))

(defun append-to-file (path string)
  (with-temp-buffer
    (insert string)
    (write-region (point-min) (point-max) path t)))

(defun add-to-history-and-file (line)
  (when (not (blankp line))
    (add-history line)
    (append-to-file history-file (format "%s\n" line))))

(defun repl (prompt)
  (load-history)
  (let (line)
    (while (setq line (readline prompt))
      (when (not (blankp line))
        (princ (format "%s\n" line))
        (add-to-history-and-file line))))
  (terpri))

(repl "> ")
