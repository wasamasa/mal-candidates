- I've had lots of issues getting this thing installed, curiously
  their website provides snapshots for all kinds of UNIX systems
  (including an italian supercomputer and obviously, Cray products),
  but no Linux whatsoever (they claim on Gitter that Debian is
  supported though)
- The compiler is slow as molasses.  Compiling the simple hello world
  example takes 5(!) seconds.  This test suite takes 10 seconds.
- If I instruct it to keep the generated C code with `--savec <dir>`,
  I get 1.5M of C files for the same hello world example.  That might
  explain compilation times, it's going to take some time for `gcc` to
  grind through all of it...
- The compiler is smart enough to figure out what modules to compile
  itself and not leaving around any intermediate files.  In other
  words, it doesn't lend itself well to Makefiles or incremental
  compilation.
- The `void` type isn't what you think it is.  Anything `void` is
  removed from the generated code which allows conditional compilation
  much like you'd do with `#ifdef`.
- GC isn't implemented yet.  There is manual deletion of allocated
  resources, as well as community-provided reference counting types.
- Lambdas are implemented, but closures are explicitly forbidden.
  That's far from the only restriction, but the most crucial one for
  me.
- The compiler infers types if possible which is very useful
- Newly created arrays have a size of 1 or greater. You can use
  `ary.clear()` afterwards to reset their size.
- Domains are a quite weird concept, but probably necessary to allow
  for distributed processing of a collection.  The weirdest part of it
  so far is dictionaries where the keys are linked to the values, yet
  exist in separate variables...
- FFI is a tad weird as it supports constant C strings only and `NULL`
  cannot be represented, so you have to use a pointer to char and
  create a string from it. It cannot represent freeable strings
  either, instead you mark the C string you create the string from as
  not to be copied.
- No append mode in their IO module, even though there is a mapping to
  append mode in the sources...
