Red []

#system [
    #import [
        "libreadline.so" cdecl [
            gnu_readline: "readline" [
                prompt [c-string!]
                return: [c-string!]
            ]
            gnu_add_history: "add_history" [
                line [c-string!]
            ]
        ]
    ]
    #import [
        LIBC-file cdecl [
            libc_strdup: "strdup" [
                string [c-string!]
                return: [c-string!]
            ]
        ]
    ]
]

readline: routine [prompt [string!] /local len s] [
    len: -1
    s: gnu_readline unicode/to-utf8 prompt :len
    if s = null [
        s: libc_strdup "q"
    ]
    stack/set-last as red-value! string/load s length? s UTF-8
    free as byte-ptr! s
]

add-history: routine [line [string!] /local len] [
    len: -1
    gnu_add_history unicode/to-utf8 line :len
]

history-file: make file! rejoin [get-env "HOME" "/.mal_history"]

blank?: function [input] [
    ws: charset reduce [space tab cr lf]
    parse input [any ws]
]

load-history: function [] [
    attempt [
        foreach line read/lines history-file [
            if not blank? line [
                add-history line
            ]
        ]
    ]
]

add-to-history: function [line] [
    add-history line
    write/append history-file rejoin [line lf]
]

repl: function [prompt] [
    load-history

    while [
        line: readline prompt
        line <> "q"
    ] [
        if not blank? line [
            print line
            add-to-history line
        ]
    ]
]

repl "> "
print ""
