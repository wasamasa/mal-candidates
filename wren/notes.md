- The most advanced language from Bob Nystrom
- I see traces of Lua, Ruby and more
- Unfortunately the docs don't reflect the modules for IO and other
  system-specific things
- The latest version fails building thanks to `-Werror` and GCC
  getting better at detecting potential buffer overflows
- Reading user input seems to be wonky as it registers extraneous
  input interactively, but works fine when redirected
- Error handling is minimal, I had to write my own `ignoreErrors`
  which spawns a new fiber, checks for an error and returns `null` or
  the result
- You can raise errors, but only strings,so it's recommended to return
  error values...
- The language offers a way to measure time, but it's about CPU
  time...
- It seems I'll have to use their FFI, however it appears that I'll
  need to embed Wren in a C program for that
- The REPL uses ANSI escapes to color what you type, however it prints
  results in bright white. This makes them unreadable when using a
  light terminal color scheme...
