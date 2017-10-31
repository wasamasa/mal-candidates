;; now is already defined, so redefine it
(constant 'now (fn () (time-of-day)))

(define (readline prompt)
  (print prompt)
  (read-line))

(define (read-words prompt)
  (let ((words))
    (while (readline prompt)
      (push (current-line) words))
    (reverse words)))

(define (the-answer)
  (+ (* 5 8) 2))

(define (make-greeter target)
  (letex ((target target))
    (fn () (append "Hello " target "!"))))

(define (hostname)
  (trim (read-file "/etc/hostname")))

(define (argv)
  (4 (main-args)))

(set 'errno nil)

(define (fail-gracefully)
  (when (not (catch
               (throw-error (begin
                              (set 'errno 42)
                              "Test"))
               'msg))
    (list msg errno)))

;; it's really stupid that I can't name an argument args because there
;; is already a built-in with that name...
(define (splat op arguments)
  (apply op arguments))

(define (tokenize input)
  (let ((tokens)
        (i 0)
        (PCRE_ANCHORED 16))
    (while (< i (length input))
      (let (token (regex "\\s*([-()+*/]|\\d+)" input PCRE_ANCHORED i))
        (if token
            (begin
              (push $1 tokens)
              (++ i (token 2)))
            (begin
              (push (i input) tokens)
              (set 'i (length input))))))
    (reverse tokens)))

(define (keys dict)
  (map first dict))

(new Class 'Rect)
(define (Rect:size) (self 1))
(define (Rect:size! size) (setf (self 1) size))
