MODULE Repl EXPORTS Main;

IMPORT IO, Rd, FileWr, Wr, Env, Text;
FROM Readline IMPORT Readline, AddHistory;

VAR historyfile := Env.Get("HOME") & "/.mal_history";

PROCEDURE LoadHistory() =
  VAR line: TEXT;
  BEGIN
    WITH rd = IO.OpenRead(historyfile) DO
      IF rd # NIL THEN
        WHILE NOT Rd.EOF(rd) DO
          line := Rd.GetLine(rd);
          AddHistory(line);
        END;
      END
    END;
  END LoadHistory;

PROCEDURE AppendLine(path: TEXT; line: TEXT) =
  BEGIN
    WITH wr = FileWr.OpenAppend(path) DO
      Wr.PutText(wr, line & "\n");
      Wr.Close(wr);
    END;
  END AppendLine;

PROCEDURE AddToHistory(line: TEXT) =
  BEGIN
    IF NOT Text.Empty(line) THEN
      AddHistory(line);
      AppendLine(historyfile, line);
    END;
  END AddToHistory;

PROCEDURE Repl(prompt: TEXT) =
  VAR done := FALSE;
  VAR line: TEXT;
  BEGIN
    LoadHistory();
    WHILE NOT done DO
      line := Readline(prompt);
      IF line = NIL THEN
        done := TRUE
      ELSIF NOT Text.Empty(line) THEN
        IO.Put(line & "\n");
        AddToHistory(line);
      END;
    END;
    IO.Put("\n");
  END Repl;

BEGIN
  Repl("> ");
END Repl.
