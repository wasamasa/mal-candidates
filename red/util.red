Red []

read-words: function [prompt] [
    words: []
    while [
        word: ask prompt
        word <> "q"
    ] [
        append words word
    ]
    words
]

the-answer: function [] [
    2 * 3 * (4 + 3)
]

make-greeter: function [target] [
    compose/deep [rejoin ["Hello " (target) "!"]]
]

hostname: function [] [
    trim/lines read %/etc/hostname
]

argv: function [] [
    system/options/args
]

fail-gracefully: function [] [
    if error? err: try [
        make error! "Test"
    ] [
        err/arg1
    ]
]

; splat cannot be implemented because red doesn't have varargs

tokenize: function [input] [
    ws: charset reduce [space tab cr lf]
    paren: charset "()"
    op: charset "+-*/"
    digit: charset "0123456789"
    number: [some digit]
    non-term: [some ws]
    term: [number | paren | op]
    expr: [some [non-term | keep term]]
    parse input [collect expr]
]

keys: function [dict] [
    keys-of dict
]

_now: function [] [
    then: now/precise
    date: to integer! then/date
    time: to float! then/time
    (date + time) * 1000
]

rect: make object! [size: none]
