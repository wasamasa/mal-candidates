include Util;

let then_ = Util.now();
let dict = Hashtbl.create(2);
Hashtbl.add(dict, "foo", 1);
Hashtbl.add(dict, "bar", 2);
let r1 = { size: 6 };

Printf.printf("Reading words...\n");
Printf.printf("Words: [%s]\n", String.concat(", ", Util.readWords("> ")));
Printf.printf("The answer: %i\n", Util.theAnswer());
Util.makeGreeter("World")();
switch (Util.hostname()) {
| Some(hostname) => Printf.printf("Hostname: %s\n", String.trim(hostname));
| None => Util.die();
};
Printf.printf("Argv: [%s]\n", String.concat(", ", Util.argv()));
Printf.printf("Error: %s\n", Util.failGracefully());
/* no varargs, no splat */
Printf.printf("Tokens: [%s]\n", String.concat(", ", Util.tokenize("1 * (2 * 3) + 4")));
Printf.printf("Keys: [%s]\n", String.concat(", ", Util.keys(dict)));
Printf.printf("Rect r1 size: %i\n", r1.size);
Printf.printf("Doubling rect size...\n");
r1.size = r1.size * 2;
Printf.printf("Rect r1 size: %i\n", r1.size);
Printf.printf("Elapsed time: %.2fms\n", Util.now() -. then_);
