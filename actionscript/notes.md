- Turns out there is one crazy guy who'd love AS3 for CLI stuff
- The result isn't quite ready yet, but appears to be usable
- I made my own package with correctly symlinked binaries
- It's not terribly clear what the difference between `redshell` and
  `redtamarin` is, `redshell` boots up way faster with useless error
  messages, `redtamarin` boots up slower with helpful error messages
- Redbean (the compiler frontend) doesn't work as described, instead I
  had to use the bundled `asc2.jar`
- AS3 looks like a bizarro JS to me, with optional type annotations
  and classes
- The Wiki consists of many TODO items and isn't very helpful
- There are a few different APIs one can use, C (!), Flash, Tamarin
- This allows you to combine the best parts of JS and C
- It took me a bit of headscratching, but I eventually found that
  `Program.write` allows me to print without a trailing newline
  (unlike what the poorly named `trace` function does)
- Namespace organization in general is weird, if a namespace doesn't
  provide a package (and just functions), you can only import them
  all...
