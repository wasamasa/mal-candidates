- The NEWT0 interpreter has to be built with `-m32` as its memory
  management assumes a hardcoded width for pointers...
- The interpreter's error handling is terrible, most of the time it
  just quits cleanly without printing any hint or aborting properly
- I couldn't get FFI to work (it fails silently and trying to install
  its libraries fails because there's no mac-specific built
  libraries...), so `Gets` it is
- I quite like Apple's NewtonScript manual
- "Rather than invent an entirely new syntax, NewtonScript was
  designed with Pascal in mind. Wherever possible, its syntax is
  modeled closely on Pascal’s."
- Inspired by Lisp and Smalltalk, as seen by quote used for object
  literals, the `true`/`nil` dichitomy, messages sent to frames (which
  look like JS objects), `$` as char syntax, symbols, many things
  evaluating to something useful (including the last thing in a
  function), etc.
- `&` concatenates strings, `&&` concatenates them with a space
  interspersed...
- NEWT0 can only handle a variable with a function value in `Apply`,
  the name of a globally defined function won't work
- NEWT0 comes with the bare minimum, for instance there's no
  `ArrayInsert` function so I had to make my own (create an array with
  one more slot, copy old values over, put argument into last slot)
- The language doesn't provide a clean way to enter a space character
  literal (elisp for instance has `?\s` to avoid `? ` which might be
  eaten by automatic formatting), so these look a bit weird,
  especially without the doubled space
- The language is unfortunately case-insensitive, despite this there
  are conventions on casing
- Most curiously, NEWT0 does have file and regex operations in a
  separate library that's not part of core (which is somewhat
  understandable as these aren't part of vanilla NewtonScript either)
  named "protoFILE" and "protoREGEX"
