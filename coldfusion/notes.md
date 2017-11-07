- Thankfully someone wrote a CLI tool for interacting with CFML, you'd
  otherwise have to write lots of Java to do something else than
  serving pages with an application server
- The code is written in CFScript which mostly feels like JS from a
  bizarro world but is so much nicer than using tag-based CFML
- The Java interop is surprisingly nice and a must for things such as
  portably printing strings(!), reading user input with proper EOF
  handling or getting an environment variable
- Exception handling is too grain-coarsed, you can either throw a
  bunch of strings or a Java object, similarly catching only works for
  defined exception types or all Java exceptions
- While there's importable modules/objects, it's far easier to just
  include source code
- Easily the weirdest splat function so far
- Built-in functions (which really are tags) and user-defined
  functions are treated differently, so if you wrote your own map
  function, you couldn't pass the `trim` built-in to it...
- Execution is unbelievably slow, all the other things I've tried so
  far finish in less than a millisecond whereas `coldfusion/run` takes
  at least 50ms
