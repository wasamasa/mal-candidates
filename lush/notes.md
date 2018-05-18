- This one is for scientific programming
- Case-insensitive identifiers make me weep. Not quite sure what to
  think of them treating `-` and `_` the same, it makes interop a tad
  easier.
- Unfortunately it doesn't work properly on 64bit machines, so I had
  to create a 32bit Docker image...
- The community appears to be completely dead, aside the occasional
  newbie question
- No way to handle errors, only to execute code before the default
  handler kicks in
- Dynamically scoped, so no closures (you can do the classic trickery,
  like using macros with values spliced in or using array literals and
  mutating them)
- Many ways to define function-like things, including fexprs, macros
  taking their own name as argument and macros which don't
- This is a Lisp-1, so weird things happen if you try reusing
  identifiers...
- The object system is CL-like and quite dynamic
- The FFI is useful, but could use some more polish.  `void` isn't
  handled as return value, converting pointers to strings doesn't
  handle `void` correctly, `fgets` returns garbage instead of `NULL`, etc.
