- Industry-strength successor to Modula-2+ (which itself succeeds the
  Wirth-approved Modula-2)
- There is exactly one usable implementation, the open-sourced
  Critical Mass Modula-3 compiler
- I only managed installing the binary snapshot, due to unusual
  packaging it lives in `/usr/local/cm3`, so `PATH` trickery is a must
- Modula-3 prides itself as being fully procedural, with a simple OOP
  system, generics and exceptions
- Safety is a big topic, several convenience extensions that would
  compromise it have been omitted to achieve that goal (such as
  importing everything unprefixed, varargs, omitting the procedure
  name after `END`, etc.)
- Unsafe code has to go into its own module
- Interfaces are mandatory and allow catching lots of mistakes
- I'm not terribly happy with their `make` replacement as it doesn't
  work perfectly and can get into a state where you need to clean
  everything to proceed
- Their compiler assumes only source files are in the current
  directory and creates a directory named after the target
  architecture to put binaries in
- You cannot implicitly discard a function's return value unless you
  use `EVAL ...`
- The safety guarantees merely mean that the runtime doesn't get
  corrupted by safe operations, if you do an error (like,
  dereferencing `NIL` at runtime), you get an error message and a
  clean abort (which dumps core)
- It's not obvious how to use a generic form of a data structure, the
  sources suggest that some degree of auto-generated code is used
- Compiler warnings and error are somewhat helpful as they're thorough
  (every ignored exception produces a warning), but sometimes cryptic
- There are no closures, but they've been emulated in core by defining
  a class with a `REF` to a procedure, a slot for user data and
  `bind`/`call` methods
- Interfaces are designed with top-level procedures as the dominant
  API, class methods are in the minority
- Decent standard library with good documentation, the only thing I've
  been missing is regular expressions (you can use `Lex` instead)
- Readers don't have a `PeekChar` method, instead you use `GetChar`
  followed by `UnGetChar`
