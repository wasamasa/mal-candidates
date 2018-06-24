require "readline.h", "-lreadline";
extern "readline" proc readline_(prompt: c_string): c_ptr(c_char);
extern "add_history" proc add_history_(line: c_string);

proc readline(prompt: string, ref buf: string): bool {
  var ret = readline_(prompt.c_str());
  if ret == nil then
    return false;
  else {
    buf = new string(ret:c_string, needToCopy=false);
    return true;
  }
}

proc add_history(line: string) {
  add_history_(line.c_str());
}

use FileSystem;

var home: c_string;
Sys.sys_getenv("HOME".c_str(), home);
var history_file = new string(home) + "/.mal_history";
writeln(history_file);

proc load_history() {
  try! {
    var f = open(history_file, iomode.r);
    for line in f.lines() {
      add_history(line.strip(leading=false));
    }
    f.close();
  } catch FileNotFoundError {}
}

proc is_blank(s: string) {
  return s.size == 0 || s.isSpace();
}

proc append_line(path: string, line: string) {
  var content: string;
  try! {
    var r = openreader(path);
    r.readstring(content);
    r.close();
  } catch FileNotFoundError {}

  var w = openwriter(path);
  w.writeln(content + line);
  w.close();
}

proc add_to_history(line: string) {
  if (!is_blank(line)) {
    add_history(line);
    append_line(history_file, line);
  }
}

proc repl(prompt: string) {
  var line: string;
  load_history();
  while (readline(prompt, line)) {
    if (!is_blank(line)) {
      writeln(line);
      add_to_history(line);
    }
  }
  writeln("");
}

repl("> ");
