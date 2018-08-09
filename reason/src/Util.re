[@bs.module "./readline.js"] external readline: string => Js.nullable(string) = "";
let readWord = (prompt: string) => Js.Nullable.toOption(readline(prompt));

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

let die = () => {
  Printf.printf("This shouldn't happen\n");
  exit(1);
}

let tokenize = (input: string) => {
  let re = [%re "/ *([-+*\\/()]|[0-9]+)/g"];
  let rec loop = (acc) => {
    switch (Js.Re.exec(input, re)) {
    | Some(m) =>
      switch (Js.Nullable.toOption(Js.Re.captures(m)[1])) {
      | Some(token) => loop([token, ...acc]);
      | None => die();
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
let now = () => Sys.time() *. 1000.0;
