- Reason advertises itself as a less foreign syntax for OCaml that
  compiles to both JS and native code
- The docs don't say much on the latter though
- You might just as well use BuckleScript directly (their compiler
  backend) and compile actual OCaml code to JS...
- Most confusingly, several of their docs suggest a currying style
  without parentheses, but I keep getting syntax errors if I try
  omitting them
- The FFI allows massaging the resulting JS code, it ranges between
  just inlining the code in question and using fancy declarations
- The build system is way too complicated and obscures useful errors
  you'd get (in the case of syntax errors you'll want to look at the
  first error)
- Unlike in SML, you get `printf` which is quite nice
- There are several parts of the OCaml API that are left
  unimplemented, such as most of the system interface (which is why I
  rolled my own `now`, `slurp` and `gets`)
- While exceptions do exist (and copious amounts of the API use them
  for hysterical raisins), the docs recommend to use option types
  instead
