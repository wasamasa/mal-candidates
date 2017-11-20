val timer = Timer.totalRealTimer ();

fun println str = TextIO.output (TextIO.stdOut, str ^ "\n")

fun readline prompt = (
  TextIO.output (TextIO.stdOut, prompt);
  TextIO.flushOut TextIO.stdOut;
  TextIO.inputLine TextIO.stdIn
)

fun chomp str =
  if String.isSuffix "\n" str then
      String.substring (str, 0, size str - 1)
  else str

fun readWords prompt =
  let fun loop (acc) =
        case readline prompt of
            NONE => rev acc
          | SOME input => loop (chomp input::acc)
  in loop []
  end

fun theAnswer () = 5 * 9 - 3

fun makeGreeter name =
  fn () => "Hello " ^ name ^ "!\n"

fun hostname () =
  let val file = TextIO.openIn "/etc/hostname"
      val content = TextIO.inputAll file
      val _ = TextIO.closeIn file
  in chomp content
  end

fun argv () = CommandLine.arguments ()

exception CustomException of string;

fun failGracefully () =
  (raise CustomException "test") handle CustomException msg => msg

(* NOTE: neither varargs nor apply are a thing in a curried language *)

fun member x xs = List.exists (fn y => x = y) xs
val special = String.explode "(+-*/)"

fun tokenizeNumber (acc, substr) =
  case Substring.getc substr of
      NONE => (acc, substr)
    | SOME (c, rest) =>
      if Char.isDigit c then
          tokenizeNumber (acc ^ Char.toString c, rest)
      else
          (acc, substr)

fun tokenize (tokens, substr) =
  case Substring.getc substr of
      NONE => rev tokens
    | SOME (c, rest) =>
      if member c special then
          let val token = Char.toString c
          in tokenize (token::tokens, rest)
          end
      else if Char.isDigit c then
          let val (token, rest) = tokenizeNumber (Char.toString c, rest)
          in tokenize (token::tokens, rest)
          end
      else if Char.isSpace c then
          tokenize (tokens, Substring.dropl Char.isSpace rest)
      else
          raise Fail (Substring.string rest)

fun tokens str = tokenize ([], Substring.full str)

fun keys dict = map (fn (k, _) => k) dict

type rect = {size : int}
fun rectSize {size} = size

fun now () =
  Time.toMilliseconds (Timer.checkRealTimer timer)
