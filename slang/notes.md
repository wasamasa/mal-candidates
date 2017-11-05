- Using stdio sucks big time
- You have to explicitly ignore unused return values as they'll
  otherwise be returned instead of what you put after the return
  statement
- No anonymous functions, so it's references to named functions only
- There doesn't seem to be a way to write a generic splat function, it
  only works reliably for fixed arity functions
