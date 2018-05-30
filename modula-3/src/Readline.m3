UNSAFE MODULE Readline;
IMPORT M3toC, Cstdlib;

PROCEDURE Readline(prompt: TEXT): TEXT =
  VAR c_prompt := M3toC.CopyTtoS(prompt);
  VAR c_string := readline(c_prompt);
  VAR string: TEXT;
  BEGIN
    M3toC.FreeCopiedS(c_prompt);
    IF c_string = NIL THEN
      RETURN NIL
    ELSE
      string := M3toC.CopyStoT(c_string);
      Cstdlib.free(c_string);
      RETURN string;
    END
  END Readline;

PROCEDURE AddHistory(line: TEXT) =
  VAR c_line := M3toC.CopyTtoS(line);
  BEGIN
    add_history(c_line);
    M3toC.FreeCopiedS(c_line);
  END AddHistory;

BEGIN
END Readline.
