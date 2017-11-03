(import "libc.so.6" "free")

(define gnu_readline (import "libreadline.so" "readline"))

(define (readline prompt)
  (let (result (gnu_readline prompt))
    (if (zero? result)
        nil
        (let (line (get-string result))
          (free result)
          line))))

(import "libreadline.so" "add_history")

(set 'history-file (append (env "HOME") "/.mal_history"))

(define (blank? line)
  (regex "^\\s*$" line))

(define (load-history)
  (let (in (open history-file "r"))
    (when in
      (while (read-line in)
        (when (not (blank? (current-line)))
          (add_history (current-line))))
      (close in))))

(define (add-to-history line)
  (when (not (blank? line))
    (add_history line)
    (let (out (open history-file "a"))
      (write-line out line)
      (close out))))

(define (repl prompt)
  (load-history)
  (let ((done))
    (while (not done)
      (let (line (readline prompt))
        (if (string? line)
            (begin
              (println line)
              (add-to-history line))
            (set 'done true))))))

(repl "> ")
(println)
(exit)
