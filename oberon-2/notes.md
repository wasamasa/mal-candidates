- The most recent language by Wirth!
- He took a minimalist approach to it, chucking out all not strictly
  necessary features
- Oberon does therefore not have exceptions, no records/arrays as
  return types, no string type (strings are character arrays, string
  literals can be assigned to a character array with zero termination)
  and is missing quite a bit of convenience API (like, printing `REAL`
  numbers with fixed point representation or reading in a line into a
  string)
- The Oberon report is quite short, but has the occasional typo that
  makes it harder to figure out the correct syntax
- String processing is roughly as tricky as in C, if not even trickier
  as you cannot dynamically allocate arrays, only pointers to a record
  type are allowed
- Most code will therefore do a type alias to a string of a certain
  size and make sure string procedures zero-terminate the passed
  buffer
- Since you cannot allocate arrays, you cannot meaningfully implement
  dynamic arrays, other than faking them with linked lists of chunks
  (which is rather tricky to get right)
- Another inconvenience is that `NEW` doesn't return a meaningful
  value, so you cannot just create newly allocated memory all over the
  place (you can only do it per identifier), other than by using
  `COPY`
- Therefore I implemented linked lists (again, but for slighly
  different reasons than in Simula-67, for that one it was an
  implementation restriction)
- A nice thing is that you can't really shoot yourself in the foot,
  the language itself is quite safe
- The OBNC compiler is quite good, but the error messages are minimal.
  You only get "syntax error" for many problems and have to figure it
  out yourself.  This includes things like an extraneous semicolon...
