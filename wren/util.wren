import "io" for Stdin, Stdout, File
import "os" for Process

class Rect {
  size { _size }
  size=(value) { _size = value }
  construct new(value) {
    _size = value
  }
}

class Util {
  static ignoreErrors(fn) {
    var fiber = Fiber.new(fn)
    var result = fiber.try()
    if (fiber.error) {
      return null
    } else {
      return result
    }
  }

  static readLine(prompt) {
    System.write(prompt)
    Stdout.flush()
    return Util.ignoreErrors { Stdin.readLine() }
  }

  static readWords(prompt) {
    var words = []
    var word
    while ((word = Util.readLine(prompt)) != null) {
      words.add(word)
    }
    return words
  }

  static theAnswer() {
    return 2 * 3 * 7
  }

  static makeGreeter(target) {
    return Fn.new {
      System.print("Hello %(target)!")
    }
  }

  static chomp(string) {
    if (string[-1] == "\n") {
      return string[0...-1]
    }
    return string
  }

  static hostname() {
    return Util.chomp(File.read("/etc/hostname"))
  }

  static argv() {
    return Process.arguments
  }

  static failGracefully() {
    var fn = Fiber.new {
      Fiber.abort("Test 42")
    }
    fn.try()
    if (fn.error != null) {
      return fn.error
    }
    return null
  }

  static explode(string) {
    return string.codePoints.map { |c| String.fromCodePoint(c) }.toList
  }

  static readWhitespace(chars) {
    return chars
  }

  static tokenize(input) {
    __whitespace = " \t\n"
    __digits = "0123456789"
    __symbols = "(+-*/)"
    var tokens = []
    var chars = Util.explode(input)
    while (chars.count > 0) {
      var char = chars[0]
      if (__whitespace.contains(char)) {
        while (chars.count > 0 && __whitespace.contains(chars[0])) {
          chars.removeAt(0)
        }
      } else if (__digits.contains(char)) {
        var token = []
        while (chars.count > 0 && __digits.contains(chars[0])) {
          token.add(chars.removeAt(0))
        }
        tokens.add(token.join())
      } else if (__symbols.contains(char)) {
        tokens.add(chars.removeAt(0))
      } else {
        chars = []
      }
    }
    return tokens
  }

  static keys(map) {
    return map.keys.toList
  }

  static now() {
    // this is wrong because it measures CPU time, FFI could help
    return System.clock * 1000
  }
}