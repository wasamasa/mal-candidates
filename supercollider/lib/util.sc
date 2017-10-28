CustomError : Error {
  *new {
    |what|
    ^super.new(what)
  }
}

Rect_ {
  var <>size;
  *new {
    |size|
    ^super.newCopyArgs(size)
  }
}

Util {
  classvar stdin;

  *initClass {
    stdin = File.open("/dev/stdin", "r");
  }

  *readline {
    |prompt|
    var line;
    prompt.post;
    ^stdin.getLine
  }

  *readWords {
    |prompt|
    var words = [], word;
    while { word = this.readline(prompt); word.notNil } {
      words = words.add(word);
    };
    ^words
  }

  *theAnswer {
    ^2 * 3 * (1 + 6)
  }

  *makeGreeter {
    |name|
    ^{ "Hello %!\n".postf(name) }
  }

  *hostname {
    ^File.use("/etc/hostname", "r", { |f| f.readAllString }).stripWhiteSpace
  }

  *argv {
    ^"SC_ARGS".getenv.split($\v)
  }

  *failGracefully {
    try { CustomError.new("Test").throw } {
      |error|
      ^error.what
    }
  }

  *splat {
    |op, args|
    ^op.value(*args)
  }

  *tokenize {
    |input|
    var i = 0, match, re = "[[:space:]]*([-()+*/]|[[:digit:]]+)";
    var token, tokens = [];
    { match = input.findRegexpAt(re, i); match.notNil }.while {
      token = match[0].stripWhiteSpace;
      i = i + match[1];
      tokens = tokens.add(token);
    };
    ^tokens
  }

  *keys {
    |dict|
    ^dict.keys.asArray
  }

  *now {
    ^Process.elapsedTime * 1000
  }
}
