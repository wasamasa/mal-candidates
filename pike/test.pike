int sum(array(int) ... args) {
  return Array->sum(args);
}

int main(int argc, array(string) argv) {
  float then = Util->now();
  mapping dict = (["foo": 1, "bar": 2]);
  Util.rect r1 = Util->rect(6);
  write("Reading words...\n");
  write("Words: [%s]\n", Util->read_words("> ") * ", ");
  write("The answer: %d\n", Util->the_answer());
  Util->make_greeter("World")();
  write("Hostname: %s\n", Util->hostname());
  write("ARGV: [%s]\n", (argv[1..] * ", "));
  write("Error: %s: %d\n", @Util->fail_gracefully());
  write("Sum: %d\n", Util->splat(sum, ({1, 2, 3, 4})));
  write("Tokens: [%s]\n", Util->tokenize("1 * (2 * 3) + 4") * ", ");
  write("Keys: [%s]\n", Util->keys(dict) * ", ");
  write("Rect r1 size: %d\n", r1->size);
  write("Doubling rect size...\n");
  r1->size *= 2;
  write("Rect r1 size: %d\n", r1->size);
  write("Elapsed time: %.2fms\n", Util->now() - then);
  return 0;
}
