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
      var f = open("/etc/hostname", iomode.r);
      var r = f.reader();
      var line: string;
      r.readline(line);
      f.close();
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
    var tokens: [1..1] string;
    var re = try! Regexp.compile("\\s*?([-+*/()]|\\d+)");
    tokens.clear();
    for m in re.matches(input, captures=1) {
      var from = m[2].offset + 1;
      var to = from + m[2].length - 1;
      var token = input[from..to];
      tokens.push_back(token);
    }
    return tokens;
  }

  proc keys(arr: [?dom]) {
    var result: [1..1] string;
    result.clear();
    for k in dom.these() {
      result.push_back(k);
    }
    return result;
  }

  class Rect {
    var size;
  }

  proc now() {
    return timer.elapsed(Time.TimeUnits.milliseconds);
  }
}
