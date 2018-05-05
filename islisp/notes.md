- There is only one usable implementation, `openlisp` (which is closed
  source, although you might get a private copy of the sources)
- Iris is a mostly complete open-source one, but is riddled with bugs
  (like no comment handling)
- I managed digging up the tarball for TISL, but it hangs up on
  reading lines from a file...
- No ARGV support or `getenv` in the standard, so I write to a special
  file and read it out later
- There is no package system or dynamic loading of code, so you need
  to `cat` it together...
- The language in general is very static and can probably be compiled
  to efficient code
- Reading from stdin doesn't work, `(standard-input)` isn't bound to
  stdin during script execution (which would be useful and is done in
  many Scheme implementations, but isn't required by the standard in
  any form)
- Reading from the `/dev/stdin` file works, but is obviously
  non-portable and would fail on Windows
- No way to define custom exceptions (subclassing built-in classes is
  an error), but you can hijack `<standard-error>`
- Error handling is weird as you have to specify a full handler for
  anything more complicated than ignoring errors and it must transfer
  control instead of returning a value
- OOP is CLOS-like, but different enough to not be a clean subset, so
  reusing CLOS examples as is fails
- The standard library is anemic, probably due to the many types in
  the class hierarchy.  Even Scheme has `list->string`...
- You have to use `quotient` for division. This doesn't make much
  sense as the standard doesn't have something like `modulo` or
  `remainder` (as Scheme does).
