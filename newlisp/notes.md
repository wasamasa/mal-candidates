- Relative loading is emulated by using the `-w` option of the
  interpreter which changes the working directory for all load-like
  operations
- Closures need to be emulated by splicing in the argument or using
  contexts (which may be used to pass by reference)
- You may not redefine built-ins except by using `constant`, this
  seems to apply to bindings (such as function arguments) as well...
- There is an argv-like thing, but it returns the full invocation as
  opposed to omitting the already processed options
- User-defined errors may only use strings, however you can eval an
  expression for figuring out that string, so implementing an
  errno-like construct is the way to go
- It's hard to spot typos because unbound symbols evaluate to `nil`
