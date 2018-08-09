[@bs.module "./readline.js"] external readline: string => Js.nullable(string) = "";
[@bs.module "./readline.js"] external add_history: string => int = "";

let readLine = (prompt) => Js.Nullable.toOption(readline(prompt));
let addHistory = (line) => add_history(line) |> ignore;

let historyFile = Sys.getenv("HOME") ++ "/.mal_history";

[@bs.module "fs"] external readFileSync: string => string => string = "";
let slurp = path => try (Some(readFileSync(path, "utf8"))) {
  | e => {Js.log(e); None};
};

let blankRe = [%re "/^\\s*$/"];
let isBlank = (line) => Js.Re.test(line, blankRe);

let loadHistory = () => {
  switch (slurp(historyFile)) {
  | Some(content) => {
      let lines = Js.String.split("\n", content);
      Array.iter(fun (line) => if (!isBlank(line)) { addHistory(line) }, lines);
    };
  | None => ();
  }
};

[@bs.module "fs"] external appendFileSync: string => string => unit = "";
let appendToFile = (path, line) => try (appendFileSync(path, line)) {
  | e => Js.log(e);
};

let addToHistory = (line) => {
  addHistory(line);
  appendToFile(historyFile, line ++ "\n");
};

let repl = (prompt) => {
  let rec loop = () => {
    switch (readLine(prompt)) {
    | Some(line) => {
        if (!isBlank(line)) {
          Printf.printf("%s\n", line);
          addToHistory(line);
        };
        loop();
      };
    | None => Printf.printf("\n");
    };
  };
  loadHistory();
  loop();
};

repl("> ");
