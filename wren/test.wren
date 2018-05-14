import "util" for Util, Rect

var then = Util.now()
var dict = { "foo": 1, "bar": 2 }
var r1 = Rect.new(6)
System.print("Reading words...")
System.print("Words: %(Util.readWords("> "))")
System.print("The answer: %(Util.theAnswer())")
Util.makeGreeter("World").call()
System.print("Hostname: %(Util.hostname())")
System.print("ARGV: %(Util.argv())")
// errors are limited to strings
System.print("Error: %(Util.failGracefully())")
// no varargs, no apply
System.print("Tokens: %(Util.tokenize("1 * (2 * 3) + 4"))")
System.print("Keys: %(Util.keys(dict))")
System.print("Rect r1 size: %(r1.size)")
System.print("Doubling rect size...")
r1.size = r1.size * 2
System.print("Rect r1 size: %(r1.size)")
// CPU time, not wall clock time
System.print("Elapsed time: %(Util.now() - then)ms")
