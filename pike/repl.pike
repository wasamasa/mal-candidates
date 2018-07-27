string history_file = combine_path(getenv("HOME"), ".mal_history");
mixed space_re = Regexp.PCRE("^[ \t\n]*$");

int is_blank(string s) {
  return space_re.match(s);
}

void load_history() {
  catch {
    mixed f = Stdio.FILE(history_file);
    foreach(f->line_iterator(); int linenr; string line) {
      if (!is_blank(line)) {
        Readline.add_history(line);
      }
    }
  };
}

void add_to_history(string line) {
  Readline.add_history(line);
  Stdio.append_file(history_file, sprintf("%s\n", line));
}

void repl(string prompt) {
  mixed line;
  load_history();
  while ((line = Readline.readline("> "))) {
    if (!is_blank(line)) {
      write("%s\n", line);
      add_to_history(line);
    }
  }
  write("\n");
}

int main() {
  repl("> ");
  return 0;
}
