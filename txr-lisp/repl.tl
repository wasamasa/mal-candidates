(with-dyn-lib "libreadline.so"
  (deffi readline "readline" str-d (str))
  (deffi add-history "add_history" void (str)))

(defvar history-file (append (getenv "HOME") "/.mal_history"))

(defun blankp (line)
  (all line 'chr-isblank))

(defun load-history ()
  (each ((line (ignerr (file-get-lines history-file))))
    (when (not (blankp line))
      (add-history line))))

(defun add-to-history (line)
  (when (not (blankp line))
    (add-history line)
    (file-append-lines history-file (list line))))

(defun repl (prompt)
  (load-history)
  (let (line)
    (while (set line (readline prompt))
      (when (not (blankp line))
        (format t "~a\n" line)
        (add-to-history line))))
  (format t "\n"))

(compile-only
 (repl "> "))
