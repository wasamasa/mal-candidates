- EOF on user input returns "q", so the `run` script sends
  `"foo\nbar\nbaz\nq"` instead
- The `run` script does intentionally not use `exec` because that
  yields an error: https://github.com/red/red/issues/2356#issuecomment-264748066
- There is no closure support yet, unlike in REBOL
- Read-only closures can be simulated by crafting a block (made simple
  by using the `compose` word)
- You might not need closures if you're merely referring to a globally
  bound series...
- Writable closures can be simulated with the following snippet:

```
closure: func [vars spec body][
    ; Don't have to reuse 'spec name; just saves a word.
    bind (body-of spec: func spec body) (context vars)
    :spec
]
```

```
>> count: closure [counter: 0] [/reset] [either reset [counter: 0] [counter: counter + 1]]
== func [/reset][either reset [counter: 0] [counter: counter + 1]]
>> count
== 1
>> count
== 2
>> count
== 3
>> count/reset
== 0
>> count
```

- No varargs means no apply...
- No regex, but the parse dialect is pretty neat
