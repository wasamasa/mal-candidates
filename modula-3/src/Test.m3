MODULE Test EXPORTS Main;
IMPORT Util, TextIntTbl, IO, Fmt;
FROM Util IMPORT Rect;

VAR then: REAL;
VAR dict: TextIntTbl.T;
VAR r1: Rect;
BEGIN
  Util.Init();
  then := Util.Now();
  dict := NEW(TextIntTbl.Default).init();
  EVAL dict.put("a", 1);
  EVAL dict.put("b", 2);
  r1 := Rect{6};

  IO.Put("Reading words...\n");
  IO.Put("Words: " & Util.Join(Util.ReadWords("> "), ", ") & "\n");
  IO.Put("The answer: " & Fmt.Int(Util.TheAnswer()) & "\n");
  (* no closures *)
  IO.Put("Hostname: " & Util.Hostname() & "\n");
  IO.Put("ARGV: [" & Util.Join(Util.Argv(), ", ") & "]\n");
  IO.Put("Error: " & Util.FailGracefully() & "\n");
  (* no apply *)
  IO.Put("Tokens: [" & Util.Join(Util.Tokenize("1 * (2 * 3) + 4"), ", ") & "]\n");
  IO.Put("Keys: [" & Util.Join(Util.Keys(dict), ", ") & "]\n");
  IO.Put("Rect r1 size: " & Fmt.Int(r1.size) & "\n");
  IO.Put("Doubling rect size...\n");
  r1.size := r1.size * 2;
  IO.Put("Rect r1 size: " & Fmt.Int(r1.size) & "\n");
  IO.Put("Elapsed time: " & Fmt.Real(Util.Now() - then, prec := 2) & "ms\n");
END Test.
