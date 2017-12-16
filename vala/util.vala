using Gee;

public errordomain UserError {
    TEST
}

struct Rectangle {
    public int size;
}

delegate string GreeterFunc();

class Util : GLib.Object {
    public static string join_list(ArrayList<string> strings, string separator) {
        if (strings.size == 0) {
            return "";
        } else if (strings.size == 1) {
            return strings[0];
        }

        var sb = new StringBuilder(strings[0]);
        for (int i = 1; i < strings.size; i++) {
            sb.append(separator);
            sb.append(strings[i]);
        }

        return sb.str;
    }

    public static string? read_word(string prompt) {
        stdout.printf("%s", prompt);
        return stdin.read_line();
    }

    public static ArrayList<string> read_words(string prompt) {
        var words = new ArrayList<string>();
        string word;

        while ((word = read_word(prompt)) != null) {
            words.add(word);
        }

        return words;
    }

    public static int the_answer() {
        return (5 * (7 + 2)) - 3;
    }

    public static GreeterFunc make_greeter(string name) {
        GreeterFunc greeter = () => { return "Hello %s!".printf(name); };
        return greeter;
    }

    public static string hostname() {
        string content;
        FileUtils.get_contents("/etc/hostname", out content);
        return content.chomp();
    }

    public static ArrayList<string> argv(string[] args) {
        var argv = new ArrayList<string>();
        for (int i = 1; i < args.length; i++) {
            argv.add(args[i]);
        }

        return argv;
    }

    public static string fail_gracefully() {
        try {
            throw new UserError.TEST("Test");
        } catch (UserError e) {
            return e.message;
        }
    }

    // Vala has varargs, but no apply

    public static ArrayList<string> tokenize(string input) {
        var regex = new Regex(" *(\\d+|[-()+*/])");
        var tokens = new ArrayList<string>();
        MatchInfo mi;

        for (regex.match(input, 0, out mi); mi.matches(); mi.next()) {
            tokens.add(mi.fetch(1));
        }

        return tokens;
    }

    // no usable generics :<
    public static ArrayList<string> keys(HashMap<string, int> map) {
        var result = new ArrayList<string>();

        foreach (string key in map.keys) {
            result.add(key);
        }

        return result;
    }

    public static double now() {
        return get_monotonic_time() / 1000.0;
    }
}
