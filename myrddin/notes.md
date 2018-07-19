- The project website makes the project look way worse than it is
- It's rather obvious that the author of this is a Plan 9 fan: The
  compiler is `6m`, 9front is mentioned several times on the website
  and the sources are a pleasure to read
- The IRC channel is quite helpful
- I've run into two compiler oddities so far (the lack of type
  aliases and unused variables in functions being a compile error)
- It feels like ML-flavoured C (helpful compiler, type inference,
  `match`, pervasive use of option types, better APIs for things like
  type-safer memory management) which is good
- No exceptions, but you'll be fine as most APIs signal failure with
  option types (APIs wrapping `errno` are the exception), so you're
  forced to deal with failure and it's hard to forget about it
- In case you really don't want to write out the standard code which
  just terminates the program on failure, `std.try` does exactly that
- No garbage collection, I've yet to find out how to implement it for
  a MAL-like system
- The syntax is a tad weird as semicolons are optional for terminating
  lines, however a doubled semicolon terminates multi-line
  constructs
- Tuples didn't trip me up here nearly as much as in SML, despite
  using the same syntax as function calls (probably because there's no
  currying)
- I'm surprised closures are supported, by default they're allocated
  on the stack, however you can copy them to the heap with `std.fndup`
  (and have to free them with a dedicated function)
- Despite there being varargs, there is no `apply`-like construct or
  syntax, the most you can do is using va lists (which I'd rather not
  do)
- IO is unbuffered, you can use `libbio` for doing buffered IO (like,
  reading in a line).  This allows far more fine-grained control than
  doing things like flushing after a buffered print
