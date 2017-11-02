rebol []

boot-time: now/precise

read-words: func [prompt /local word words] [
    words: []
    while [
        word: ask prompt
        word <> "q"
    ] [
        append words word
    ]
    words
]

the-answer: func [] [
    2 * 3 * (4 + 3)
]

make-greeter: func [target] [
    func [] [join "Hello " [target "!"]]
]

hostname: func [] [
    trim/lines read %/etc/hostname
]

argv: func [] [
    system/options/args
]

fail-gracefully: func [/local err] [
    if error? err: try [
        make error! "Test"
    ] [
        select disarm err /arg1
    ]
]

; splat cannot be implemented because REBOL doesn't have varargs

tokenize: func [input /local tokens token ws paren op digit number non-term term expr] [
    tokens: []
    ws: charset reduce [tab newline #" "]
    paren: charset "()"
    op: charset "+-*/"
    digit: charset "0123456789"
    number: [some digit]
    non-term: [some ws]
    term: [number | paren | op]
    expr: [non-term | copy token term (append tokens token)]
    parse/all input [some expr]
]

keys: func [dict] [
    to block! extract dict 2
]

_now: func [/local diff integer float] [
    diff: difference now/precise boot-time
    integer: to integer! diff
    float: diff/second - to integer! diff/second
    (integer + float) * 1000
]

rect: make object! [size: none]
