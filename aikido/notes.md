- A language developed at Sun for creating Java-related scripts, their
  examples include a C parser
- It's mostly reminiscent of JavaScript, but with a more
  C++/Java-style OOP approach
- Some Java APIs have been included, most importantly streams (and
  stealing from C++, an stream operator for chucking things into one)
- All the expected things are included, even networking, threads and
  (textual) macros
- It's a shame they link to PCRE but only provide a single match
  function without offsets or other niceties
- Variadic functions work almost the same as in JavaScript, it's not
  documented though how to call them with an array argument, so I had
  to guess my way through
- There is a FFI that requires you to write C++...
- I had some trouble getting it to work as it's using `dlopen`, but
  prefers global libraries over local ones (which explains why they're
  using `libaikidofoo.so`, it's unlikely to clash with `libfoo.so`)
- Once a variable has been assigned a type, it's an error to assign it
  a different type.  This quirk requires extra thought for things like
  a function that may return a string or `none`, I worked around this
  with reference parameters.
