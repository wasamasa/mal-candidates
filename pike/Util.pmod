string read_word(string prompt) {
  write(prompt);
  return Stdio.stdin->gets();
}

array(string) read_words(string prompt) {
  array(string) words = ({});
  string word;

  while ((word = read_word(prompt))) {
    words += ({word});
  }
  return words;
}

int the_answer() {
  return 2 * 3 * (4 + 3);
}

function make_greeter(string target) {
  return lambda() { write("Hello %s!\n", target); };
}

string hostname() {
  return Stdio.FILE("/etc/hostname")->gets();
}

array(mixed) fail_gracefully() {
  return catch { throw(({"test", 42})); };
}

mixed splat(function op, array(mixed) args) {
  return op(@args);
}

array(string) tokenize(string input) {
  mixed re = Regexp.PCRE("[ \t\n]*([-+*/()]|[0-9]+)");
  int i = 0;
  array(string) tokens = ({});
  while (i < sizeof(input)) {
    mixed match = re.exec(input, i);
    if (match == Regexp.PCRE.ERROR.NOMATCH) {
      i = sizeof(input);
    } else {
      int from = match[2], to = match[3], size = to - from;
      string token = input[from..to-1];
      tokens += ({token});
      i = to;
    }
  }
  return tokens;
}

array(mixed) keys(mapping dict) {
  array(mixed) result = ({});
  foreach(dict; mixed key; mixed val) {
    result += ({key});
  }
  return result;
}

class rect {
  int size;

  void create(int s) {
    size = s;
  }
}

float now() {
  return gethrtime() / 1000.0;
}
