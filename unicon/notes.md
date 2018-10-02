- Very close to Icon, with many additions:
  - Regex literals (`<...>`, not terribly powerful though)
  - Objects/classes
  - Syntactic shortcuts
  - Enhanced versions of standard library procedures
- However, the only differences are that `now()` no longer requires
  FFI and an object is used for the rectangle test
- Speaking of FFI, the distribution doesn't install the `icall.h` file
  anymore, so I have to bundle it and hope the version matches
- Using classes leaves two dbm files around...
