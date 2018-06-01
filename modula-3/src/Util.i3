INTERFACE Util;
IMPORT TextSeq, TextIntTbl;

PROCEDURE Join (seq: TextSeq.T; sep: TEXT): TEXT;

PROCEDURE ReadWords(prompt: TEXT): TextSeq.T;

PROCEDURE TheAnswer(): INTEGER;

PROCEDURE Hostname(): TEXT;

PROCEDURE Argv(): TextSeq.T;

EXCEPTION CustomException(CustomExceptionInfo);

TYPE CustomExceptionInfo = RECORD
  description: TEXT;
  data: INTEGER;
END;

PROCEDURE FailGracefully(): TEXT;

EXCEPTION Error;

PROCEDURE Tokenize(input: TEXT): TextSeq.T;

PROCEDURE Keys(tbl: TextIntTbl.T): TextSeq.T;

TYPE Rect = RECORD
  size: INTEGER;
END;

PROCEDURE Now(): REAL;

END Util.
