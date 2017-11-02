- REBOL doesn't support Red's `function` keyword, so you need to use
  `func` instead and declare all local variables
- `C-d` doesn't exit the prompt, only `q` does
- Error handling works differently, you have to `disarm` one to
  continue execution
- The parse dialect is different from Red, there's no convenience
  helper for collecting values
- Date handling in Red is more advanced, REBOL merely provides a way
  of calculating time differences (with REBOL3 providing a boot time
  thing in `stats`)
