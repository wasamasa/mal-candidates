- SML feels like the clean language hiding beneath OCamL, Haskell, F#
  and Scala which is good as I have to deal with Scala at work...
- Amusingly enough, the "ML for the Working Programmer" book
  references the Scala creator here and there
- The language syntax is still unclear to me, the REPL mandates using
  semicolons to terminate expressions whereas sources have close to no
  semicolons
- Parentheses serve the double purpose of denoting tuples and grouping
  of expressions, so you can seemingly get away with calling a
  function with a parenthesized set of arguments except when it
  expects a non-tuple for currying and explodes in your face
- Parentheses are required in the most unexpected places as the
  precedence rules are a bit weird and assign high precedence to
  function calls, so if your function doesn't do currying and accept
  more than one argument, you'll need to wrap parentheses around it
- Idiomatic SML expects a function definition to consist of a single
  expression, it took me quite some time to figure out the syntax for
  grouping multiple expressions (parentheses with semicolon-separated
  statements) which is pretty much needed for the main function
- I don't really get currying yet, so far it feels like an
  implementation detail to me that forbids me from having varargs
- It's hard to write incorrect code that compiles successfully,
  deciphering compiler errors is rather tricky though
- The Emacs mode is rather annoying as it auto-indents and can only
  tell when to remove the indentation for a new top-level statement
  after you've typed out its keyword...
- The standard is surprisingly comprehensive and has almost everything
  I need except for hash tables (which I've faked as a list of
  key-value tuples), regular expressions (which aren't really
  needed anyways, you can just roll your own tokenizer), a way to load
  source files and a main function.  The latter two will make it
  annoying to make it work across more than one implementation...
- Static typing is surprisingly painless here, I have nearly no types
  specified in my code except in the definition of the rect record
- Timing gives me a negative number for some reason...
