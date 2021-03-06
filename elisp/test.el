(require 'util)

(defvar then (now))

(defun println (format-string &rest args)
  (if (not args)
      (princ format-string)
    (princ (apply 'format format-string args)))
  (terpri))

(defvar dict (make-hash-table))
(puthash 'a 1 dict)
(puthash 'b 2 dict)

(defvar r1 (rect 6))

(println "Reading words...")
(println "Words: %S" (read-words "> "))
(println "The answer: %s" (the-answer))
(println (funcall (make-greeter "World")))
(println "Hostname: %s" (hostname))
(println "ARGV: %S" (argv))
(println "Error: %S" (fail-gracefully))
(println "Sum: %s" (splat '+ '(1 2 3 4)))
(println "Tokens: %S" (tokenize "1 * (2 * 3) + 4"))
(println "Keys: %S" (keys dict))
(println "Rect r1 size: %s" (rect-size r1))
(println "Doubling rect size...")
(rect-size-set! r1 (* (rect-size r1) 2))
(println "Rect r1 size: %s" (rect-size r1))
(println "Elapsed time: %.2fms" (- (now) then))
