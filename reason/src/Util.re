let gets = [%bs.raw {|
  function() {
    const fs = require('fs');
    const bufsz = 1;
    const buf = Buffer.alloc(1);
    const stdin = 0;
    const offset = 0;
    let data = '';
    while (buf[0] !== 10 && fs.readSync(stdin, buf, offset, bufsz) !== 0) {
      data += buf.toString();
    }
    return data;
  }
|}];

let chomp = (s: string) => {
  let len = String.length(s);
  if (String.length(s) > 0 && s.[len - 1] == '\n') {
    String.sub(s, 0, len - 1);
  } else {
    s;
  };
};

let readWord = (prompt: string) => {
  Printf.printf("%s", prompt);
  switch (gets()) {
  | "" => None;
  | (input: string) => Some(chomp(input));
  };
};

let readWords = (prompt) => {
  let rec loop = (acc) => {
    switch (readWord(prompt)) {
    | Some(word) => loop([word, ...acc]);
    | None => List.rev(acc);
    };
  };
  loop([]);
};

let theAnswer = () => 2 * 3 * 7;
let makeGreeter = (target) => () => Printf.printf("Hello %s!\n", target);

[@bs.module "fs"] external readFileSync: string => string => string = "";
let slurp = path => try (Some(readFileSync(path, "utf8"))) {
  | e => {Js.log(e); None}
};

let hostname = () => slurp("/etc/hostname");
let argv = () => List.tl(List.tl(Array.to_list(Sys.argv)));

exception Custom(string, int);
let failGracefully = () => {
  try (raise(Custom("test", 42))) {
  | Custom(msg, code) => Printf.sprintf("%s: %i", msg, code);
  };
};

let tokenize = (input: string) => {
  let re = [%re "/ *([-+*\/()]|[0-9]+)/g"];
  let rec loop = (acc) => {
    switch (Js.Re.exec(input, re)) {
    | Some(m) =>
      switch (Js.Nullable.toOption(Js.Re.captures(m)[1])) {
      | Some(token) => loop([token, ...acc]);
      | None => { Printf.printf("This shouldn't happen\n"); exit(1); };
      };
    | None => List.rev(acc);
    };
  };
  loop([]);
};

let keys = (tbl) => {
  Hashtbl.fold(fun (k, _v, acc) => [k, ...acc], tbl, []);
}

type rect = { mutable size: int };
let now = [%bs.raw {| function() { return Date.now() } |}];
