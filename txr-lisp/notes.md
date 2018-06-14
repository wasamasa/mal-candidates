- This is an interesting one, designed for terse text scripting with
  both a pattern language and a Lisp
- These two languages can be mixed, but I'll ignore this for now and
  only use the Lisp language
- The documentation is a huge `man` page which is unfortunate, section
  9 would have been better off in a more hierarchical document
- It's a bit lacking when it comes to strings, I had to guess that
  `append` works on them despite it being marked as a list thing (as
  opposed to sequences)
- The Lisp language is clearly inspired by CL and Clojure which makes
  for an odd combination, they manage having an even more chaotic
  namespace than `clojure.core` while preserving many CL things in a
  simpler format
- In other words, purity is of little concern
- I feel kind of reminded of Newlisp, but there's far more helpful
  than useless feeling things in its toolbox
- I think this is the shortest tokenization function I wrote so far
- The only thing I'm missing is a `destructuring-bind`-like thing, I
  only found one in the pattern language
- Their regex dialect is homebrew and misses lots of things, such as
  anchoring and POSIX character classes
