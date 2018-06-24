module util {
  use Regexp;
  use Time;

  private var timer = new Time.Timer();
  timer.start();

  proc read_word(prompt: string, ref arg: string): bool {
    write(prompt);
    try! IO.stdout.flush();
    return try! IO.stdin.readline(arg);
  }

  proc read_words(prompt: string) {
    var words: [1..1] string;
    var word: string;
    words.clear();
    while(read_word(prompt, word)) {
      words.push_back(word.strip(leading=false));
    }
    return words;
  }

  proc the_answer() {
    return -3 + 5 * 9;
  }

  proc hostname() {
    try! {
      var r = openreader("/etc/hostname");
      var line: string;
      r.readline(line);
      return line.strip(leading=false);
    }
  }

  class CustomError : Error {
    var msg: string;
    var data: int;

    proc init(msg: string, data: int) {
      this.msg = msg;
      this.data = data;
    }
  }

  proc fail_gracefully() {
    var result: string;
    try! {
      throw new CustomError("test", 42);
    } catch e: CustomError {
      result = e.msg + ": " + e.data;
    }
    return result;
  }

  proc tokenize(input: string) {
    var re = try! Regexp.compile("\\s*([-+*/()]|\\d+)");
    var tokens = for m in re.matches(input, captures=1) do input[m(2)];
    return tokens;
  }

  proc keys(arr: [?dom]) {
    var result = for key in arr.domain do key;
    return result;
  }

  class Rect {
    var size;
  }

  proc now() {
    return timer.elapsed(Time.TimeUnits.milliseconds);
  }
}
