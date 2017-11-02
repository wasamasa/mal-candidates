- No way to access ARGV, so it's the old environment variable trick
  again
- The standard library is anemic, so I had to write a few helpers for
  printing and string processing
- You must test explicitly for `undef`
- Error reporting is somewhere between minimalistic and absent
- I had to shell out for retrieving time :<
- While there's no dynamic FFI, the module FFI looks relatively simple
