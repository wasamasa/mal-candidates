- The oldest programming language still around
- Several noteworthy revisions, F90 introduced free form syntax, F2003
  OOP, F2008 alleviates several pain points
- I'm therefore using F2008, it's reasonably well implemented by GNU
  Fortran (which is part of the GCC family)
- The file extension for free form syntax is `.f90`, no matter the
  actually used standard
- My favorite option is `-Wsurprising`, imagine having that in GCC
- Modern Fortran is quite different than what I had imagined and
  rather wordy
- You disable the feature where the variables `i`, `j`, `k` and `l`
  are automatically considered integers (while the rest are considered
  `real`) by using `implicit none` in a module, program or function
- The type of a function argument is declared with an `intent`
- If a variable is declared `parameter`, it's a constant...
- Everything boolean is surrounded with periods, be it constants
  (`.true.`) or operators (`.and.`)
- Format strings are quite weird as you specify a list of values to
  print, as opposed to freely mixing text with placeholders
- The printing function prepends a leading space unless you use the
  `g0` format specifier...
- The fixed-width modifier requires a full width (as opposed in C
  where you may only specify the width after the period), if you
  exceed that width, asterisks are printed instead of expanding the
  buffer...
- To specify a non-default precision in a portable way, you need to
  load up `iso_fortran_env` and declare a different `kind`
- String handling is a pain, while you can allocate variable-sized
  arrays, too big arrays end up padding strings with spaces
- File handling is a pain, unless you use F2008 you have to think up
  file numbers that aren't in use yet and do all operations after
  `open` with that file number as argument
- Built-ins are called intrinsics, the `new_line` one accepts a
  character argument (which is ignored)
- I've had a rather nasty bug on `-O1` and `-O2` (`-O0` and `-O3` were
  fine) where reversing a linked list occasionally failed with a
  segfault, it turned out to be insufficient initialization of
  pointers.  While the compiler can help you tracking down simple
  cases (there are options for initializing variables of certain types
  to sensible/nonsensical defaults), it doesn't implement that feature
  for pointers and allocatable arrays yet.
