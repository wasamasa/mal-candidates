use util;

proc sum(args: int ...?n) {
  return (+ reduce args);
}

proc main(args: [] string) {
  var then_ = util.now();
  var argv = args[1..];
  var dict = ["foo" => 1, "bar" => 2];
  var r1 = new util.Rect(6);
  writeln("Reading words...");
  writeln("Words: ", ", ".join(util.read_words("> ")));
  writeln("The answer: ", util.the_answer());
  // no closures, lambdas may not refer to non-global variables
  writeln("Hostname: ", util.hostname());
  writeln("ARGV: ", ", ".join(argv));
  writeln("Error: ", util.fail_gracefully());
  // HACK: it's too hard to write a generic function due to limited
  // first-class function support, but the syntax is there
  writeln("Sum: ", sum((...(1, 2, 3, 4))));
  writeln("Tokens: ", ", ".join(util.tokenize("1 * (2 * 3) + 4")));
  writeln("Keys: ", ", ".join(util.keys(dict)));
  writeln("Rect r1 size: ", r1.size);
  writeln("Doubling rect size...");
  r1.size *= 2;
  writeln("Rect r1 size: ", r1.size);
  writef("Elapsed time: %.2drms\n", util.now() - then_);
}
