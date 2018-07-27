MODULE Repl EXPORTS Main;

IMPORT TextRd, Lex, IO, Rd, FileWr, Wr, Env, Text;
FROM Readline IMPORT Readline, AddHistory;

VAR historyfile := Env.Get("HOME") & "/.mal_history";

PROCEDURE IsBlank(input: TEXT): BOOLEAN =
  BEGIN
    WITH rd = NEW(TextRd.T).init(input) DO
      Lex.Skip(rd);
      RETURN Rd.EOF(rd);
    END;
  END IsBlank;

PROCEDURE LoadHistory() =
  VAR line: TEXT;
  BEGIN
    WITH rd = IO.OpenRead(historyfile) DO
      IF rd # NIL THEN
        WHILE NOT Rd.EOF(rd) DO
          line := Rd.GetLine(rd);
          IF NOT IsBlank(line) THEN
            AddHistory(line);
          END;
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
    AddHistory(line);
    AppendLine(historyfile, line);
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
      ELSIF NOT IsBlank(line) THEN
        IO.Put(line & "\n");
        AddToHistory(line);
      END;
    END;
    IO.Put("\n");
  END Repl;

BEGIN
  Repl("> ");
END Repl.
