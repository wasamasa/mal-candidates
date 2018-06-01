MODULE Util;
IMPORT IO, Rd, Wr, TextRd, TextWr, Fmt, Lex;
IMPORT Text, TextSeq, TextIntTbl, Params, ETimer;

VAR timer: ETimer.T;

PROCEDURE Join (seq: TextSeq.T; sep: TEXT): TEXT =
  VAR printsep: BOOLEAN := FALSE;
  VAR wr: TextWr.T := NEW(TextWr.T).init();
  BEGIN
    FOR i := 0 TO seq.size() - 1 DO
      IF printsep THEN Wr.PutText(wr, sep) END;
      Wr.PutText(wr, seq.get(i));
      printsep := TRUE;
    END;
    RETURN TextWr.ToText(wr);
  END Join;

PROCEDURE ReadLine(prompt: TEXT): TEXT =
  BEGIN
    IO.Put(prompt);
    TRY
      RETURN IO.GetLine();
    EXCEPT
      IO.Error => RETURN NIL;
    END;
  END ReadLine;

PROCEDURE ReadWords(prompt: TEXT): TextSeq.T =
  VAR done: BOOLEAN := FALSE;
  VAR word: TEXT;
  VAR seq: TextSeq.T := NEW(TextSeq.T).init();
  BEGIN
    WHILE NOT done DO
      word := ReadLine(prompt);
      IF word = NIL THEN done := TRUE ELSE seq.addhi(word) END;
    END;
    RETURN seq;
  END ReadWords;

PROCEDURE TheAnswer(): INTEGER =
  BEGIN
    RETURN 6 * 6 + 6;
  END TheAnswer;

PROCEDURE Hostname(): TEXT =
  VAR line: TEXT;
  BEGIN
    WITH rd = IO.OpenRead("/etc/hostname") DO
      line := IO.GetLine(rd);
      Rd.Close(rd);
      RETURN line;
    END;
  END Hostname;

PROCEDURE Argv(): TextSeq.T =
  VAR args: TextSeq.T := NEW(TextSeq.T).init();
  BEGIN
    FOR i := 1 TO Params.Count - 1 DO args.addhi(Params.Get(i)) END;
    RETURN args;
  END Argv;

PROCEDURE FailGracefully(): TEXT =
  BEGIN
    TRY
      RAISE CustomException(CustomExceptionInfo{"Test", 42});
    EXCEPT
      CustomException(x) => RETURN x.description & ", " & Fmt.Int(x.data);
    END;
  END FailGracefully;

PROCEDURE PeekChar(rd: Rd.T): CHAR =
  VAR c: CHAR;
  BEGIN
    c := Rd.GetChar(rd);
    Rd.UnGetChar(rd);
    RETURN c;
  END PeekChar;

PROCEDURE Tokenize(input: TEXT): TextSeq.T =
  VAR tokens: TextSeq.T := NEW(TextSeq.T).init();
  VAR c: CHAR;
  CONST digit = SET OF CHAR {'0'..'9'};
  CONST special = SET OF CHAR {'(', ')', '+', '-', '*', '/'};
  BEGIN
    WITH rd = NEW(TextRd.T).init(input) DO
      WHILE NOT Rd.EOF(rd) DO
        Lex.Skip(rd);
        c := PeekChar(rd);
        IF c IN digit THEN
          tokens.addhi(Lex.Scan(rd, digit));
        ELSIF c IN special THEN
          tokens.addhi(Text.FromChar(Rd.GetChar(rd)));
        ELSE
          RAISE Error
        END;
      END;
    END;
    RETURN tokens;
  END Tokenize;

PROCEDURE Keys(tbl: TextIntTbl.T): TextSeq.T =
  VAR keys: TextSeq.T := NEW(TextSeq.T).init();
  VAR k: TEXT;
  VAR v: INTEGER;
  BEGIN
    WITH iter = tbl.iterate().init() DO
      WHILE iter.next(k, v) DO
        keys.addhi(k);
      END;
      RETURN keys;
    END;
  END Keys;

PROCEDURE Now(): REAL =
  BEGIN
    RETURN FLOAT(ETimer.Elapsed(timer)) * 1000.0;
  END Now;

BEGIN
  timer := ETimer.New("Runtime");
  ETimer.Enable();
  ETimer.Push(timer);
END Util.
