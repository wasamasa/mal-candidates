class Repl : GLib.Object {
    public static string history_file;
    public static GLib.Regex blank_re;

    public static int main(string[] args) {
        history_file = "%s/.mal_history".printf(Environment.get_variable("HOME"));
        blank_re = new Regex("^\\s*$");
        repl("> ");
        stdout.printf("\n");
        return 0;
    }

    public static void repl(string prompt) {
        load_history();
        string? line;
        while ((line = Readline.readline(prompt)) != null) {
            if (!is_blank(line)) {
                stdout.printf("%s\n", line);
                add_to_history(line);
            }
        }
    }

    public static bool is_blank(string s) {
        return blank_re.match(s);
    }

    public static void load_history() {
        try {
            var file = File.new_for_path(history_file);
            var stream = new DataInputStream(file.read());
            string line;

            while ((line = stream.read_line()) != null) {
                if (!is_blank(line)) {
                    Readline.History.add(line);
                }
            }
        } catch (Error _) {}
    }

    public static void add_to_history(string line) {
        Readline.History.add(line);
        try {
            var file = File.new_for_path(history_file);
            var stream = file.append_to(FileCreateFlags.NONE);
            stream.write("%s\n".printf(line).data);
        } catch (Error _) {}
    }
}
