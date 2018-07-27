- There are two ways of executing an Icon program:
  - Interpret it with `icon` from sources
  - Compile with `icont` to an executable (which is a shell script
    with the bytecode appended, it delegates to `iconx` for executing
    the bytecode)
- There are two ways of modularizing a program, using an include
  (honoring `LPATH`) and linking to it (honoring `IPATH`) which
  requires producing linkable files by omitting the linking step when
  compiling the library with `icont`
- The standard library is not considered to be on `IPATH` by default,
  you have to explicitly add its location there...
- Omitting the linking step will produce two "ucode" files (ending in
  `.u1` and `.u2`) which are ASCII text and resemble disassembly, with
  the first containing procedures and the second metadata
- Unlike pretty much all high-level languages I run into, Icon has a
  preprocessor
- Their approach to "goal-oriented programming" involves signalling
  failure and using it to terminate an expression but continue with
  the next one, this makes code far more terse
- It also makes debugging harder as some lines seem to not be executed
  at all, kind of like `On Error Resume Next` in Visual Basic
- There's some Prolog-inspired features, but I haven't made use of
  those yet
- Error handling is quite weird, you set a global `&error` to
  non-zero, then errors won't terminate early and can be detected
  normally by accessing the `&errornumber` and `&errorvalue`
- Even weirder are co-expressions which I use to implement closures
  with, they represent a snapshot that can access its own locals and
  be run over and over again, with weird syntax to pass in values
- The documentation is outdated with regards to the FFI, the function
  for loading them lives in `io` and `icall.h` isn't in a system-wide
  include directory, but the same place as the standard library...
- I've had to use FFI to obtain the walltime as the built-in function
  measures CPU time of the running process
