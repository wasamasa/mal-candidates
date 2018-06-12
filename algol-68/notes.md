- The Algol-68 standard is a lot more complicated than the Algol-60
  one
- The documentation for Algol 68 Genie is huge and overly formal,
  Programming Algol 68 Made Easy is a lot better in this regard
- The entire terminology is weird. My favorite so far are meek
  contexts.  Other candidates are modes (AKA types), denotation (AKA
  representation), identity declaration (AKA alias), etc.
- Identifiers may be separated by whitespace. This neatly solves the
  long-standing snake vs camel vs kebab case discussion.
- Parentheses are quite overloaded as they can do function calls, put
  multiple values into a row (as seen with `print`/`printf`),
  introduce a new scope (as syntactic sugar for `BEGIN ... END`) and
  most obviously, group expressions
- Format strings are weird, starting with the fact that they aren't
  strings, but sequences of characters delimited by dollar signs
- There are three different comment syntaxes(`COMMENT`, `CO`, `#`),
  all of which must surround the commented text.  You cannot nest the
  same type, but achieve the same effect by using different ones
  inside each other...
- Semicolons do not terminate a line, they throw away the previously
  yielded value (and force sequencing)
- Commas on the other hand do not force sequencing, but allow things
  to happen (more correctly, to be elaborated) in parallel
- The interpreter errors are frustrating
- `GOTO` is a valid way to do control flow in a procedure
- One-character strings are considered chars...
- To test whether a file has reached EOF, its mood (mode is already
  taken for types) has to be set, this happens automagically after a
  read and supposedly with the procedure for explicitly setting it,
  but not for creating with an in channel.  This makes reading the
  entire contents of a file needlessly hard because you need to read
  at least one character before doing that test (which will fail on
  empty files)...
- Structure literals are useful, however they only work with at least
  two items, kind of like Python tuples
- It's lots of pain to deal with composite data structures as the type
  checker is hard to satisfy.  I resorted to doing type case
  statements and aborting on unexpected data types...
