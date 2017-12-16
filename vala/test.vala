using Gee;

class Test : GLib.Object {
    public static int main(string[] args) {
        var then = Util.now();

        var dict = new HashMap<string, int>();
        dict.set("a", 1);
        dict.set("b", 2);

        var r1 = Rectangle() { size = 6 };

        stdout.printf("Reading words...\n");
        stdout.printf("Words: %s\n", Util.join_list(Util.read_words("> "), ", "));
        stdout.printf("The answer: %d\n", Util.the_answer());
        var greeter = Util.make_greeter("world");
        stdout.printf("%s\n", greeter());
        stdout.printf("Hostname: %s\n", Util.hostname());
        stdout.printf("ARGV: %s\n", Util.join_list(Util.argv(args), ", "));
        stdout.printf("Error: %s\n", Util.fail_gracefully());
        // Vala has varargs, but no apply
        stdout.printf("Tokens: %s\n", Util.join_list(Util.tokenize("1 * (2 * 3) + 4"), ", "));
        stdout.printf("Keys: %s\n", Util.join_list(Util.keys(dict), ", "));
        stdout.printf("Rect r1 size: %d\n", r1.size);
        stdout.printf("Doubling rect size...\n");
        r1.size = r1.size * 2;
        stdout.printf("Rect r1 size: %d\n", r1.size);
        stdout.printf("Elapsed time: %.2fms\n", Util.now() - then);
        return 0;
    }
}
