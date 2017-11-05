require("util");

define test() {
  variable x = (), y = (), z = ();
  printf("Splat: X: %S, Y: %S, Z: %S\n", x, y, z);
}

variable dict = Assoc_Type[Int_Type];
dict["foo"] = 1;
dict["bar"] = 2;

variable r1 = @Rect_Type;
r1.size = 6;

message("Reading words...");
printf("Words: {%s}\n", seq_join(read_words("> "), ", "));
printf("The answer: %i\n", the_answer());
% make_greeter is impossible to do because there are no closures or
% anonymous functions
printf("Hostname: %s\n", hostname());
printf("ARGV: [%s]\n", seq_join(argv(), ", "));
printf("Error: %s, %i\n", fail_gracefully());
splat(&test, {1, 2, 3});
printf("Tokens: {%s}\n", seq_join(tokenize("1 * (2 * 3) + 4"), ", "));
printf("Keys: [%s]\n", seq_join(keys(dict), ", "));
printf("Rect r1 size: %i\n", r1.size);
message("Doubling rect size...");
r1.size *= 2;
printf("Rect r1 size: %i\n", r1.size);
printf("Elapsed time: %.2fms\n", now());
