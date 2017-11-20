use "util";

val start = now()
val dict = [("a", 1), ("b", 2)]
val r1 : rect = {size = 6}

fun main() = (
  println "Reading words...";
  println ("Words: " ^ String.concatWith ", " (readWords "> "));
  println ("The answer: " ^ Int.toString (theAnswer ()));
  print (makeGreeter "World" ());
  println ("Hostname: " ^ (hostname ()));
  println ("ARGV: " ^ String.concatWith ", " (argv ()));
  println ("Error: " ^ (failGracefully ()));
  (* NOTE: neither varargs nor apply are a thing in a curried language *)
  println ("Tokens: " ^ String.concatWith ", " (tokens "1 * (2 * 3) + 4"));
  println ("Keys: " ^ String.concatWith ", " (keys dict));
  println ("Rect r1 size: " ^ Int.toString (rectSize r1));
  println "Doubling rect size...";
  let val r2 = {size = rectSize r1 * 2}
  in println ("Rect r2 size: " ^ Int.toString (rectSize r2))
  end;
  println ("Elapsed time: " ^ LargeInt.toString (now() - start))
)
