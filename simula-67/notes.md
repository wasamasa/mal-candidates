- GNU Cim seems to be the only obtainable Simula system
- It compiles to C, can call out to C functions and be linked together
  with modules written in C
- Cim 3.31 and 5.1 fail to compile, Cim 3.37 segfaults when compiling
  files unless patched, Cim 5.1 can be patched, but is considered
  unstable
- There's a lack of good learning material for the language which is a
  shame (I guess ALGOL is better in that aspect)
- It's not obvious how to write modular programs, the manual hints at
  `foo.atr` files referenced by `EXTERNAL CLASS Foo;`, but doesn't
  tell you how they're generated
- I eventually figured out that if you compile a file that's not a
  single statement (AKA main program), an `.atr` and `.o` file is
  emitted
- I/O is absolutely terrible. There is no `printf` equivalent or easy
  way of concatenating values, so instead you have to print out each
  value separately, then terminate with (`OutImage`) or without a
  newline (`BreakOutImage`). Reading/writing files is heavily oriented
  towards operating on one record at a time.
- The standard speaks of Images which are apparently (growable?) text
  buffers, however they only exist in the context of files
- Text is fixed-size, this complicates things like reading in user
  input.  Fortunately trying to read in more results in a run-time
  error...
- Cim exposes `Argc` and `Argv`, however `Argv` is a pointer
  represented as integer, so I had to write another foreign function
  that extracts the nth argument...
- FFI cannot deal with empty strings as return type.  I solved the
  user I/O problem by writing a custom function that either returns a
  sentinel string for EOF or user input with a newline appended.
- File I/O can thankfully be done in terms of bytes, this allows
  allocating a text as large as the file in bytes and reading into it
- Cim doesn't support arrays in class fields or as return type, so I
  can't even write a growable array class
- While there is a `Simset` class (which resembles a doubly-linked
  list), it's stupidly complex and disallows you from inserting a list
  item into more than one list
- This is why I wrote a stupidly simple cons cell class, together with
  utility functions such as `Cons`, `Car`, `Cdr`, `Pair`, `Null`,
  `Reverse`, `OutTextList`, etc.
- In Cim 5.1 I got a buffer overflow while compiling a code snippet to
  extract text values from a cons cell, in Cim 3.37 I got an error
  suggesting I forgot a cast
