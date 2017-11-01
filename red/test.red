Red []
do %util.red

then: _now
dict: #(a: 1 b: 2)
r1: make rect [size: 6]

print "Reading words..."
print ["Words:" mold read-words "> "]
print ["The answer:" the-answer]
print do make-greeter "World"
print ["Hostname:" hostname]
print ["ARGV" mold argv]
print ["Error:" fail-gracefully]
; splat cannot be implemented because red doesn't have varargs
print ["Tokens:" mold tokenize "1 * (2 * 3) + 4"]
print ["Keys:" mold keys dict]
print ["Rect r1 size:" r1/size]
print "Doubling rect size..."
r1/size: r1/size * 2
print ["Rect r1 size:" r1/size]
print ["Elapsed time:" append form _now - then "ms"]
