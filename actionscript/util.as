package {
    import C.stdio.*;
    import shell.FileSystem;
    import shell.Program;

    public class CustomError extends Error {
        public function CustomError(message:String, errorID:int) {
            super(message, errorID);
        }
    }

    public class Rect {
        private var _size:int;
        public function Rect(size:int) {
            _size = size;
        }
        public function get size():int {
            return _size;
        }
        public function set size(size:int):void {
            _size = size;
        }
    }

    public class Util {
        public static function chomp(string:String):String {
            if (string.charAt(string.length - 1) == '\n') {
                return string.slice(0, string.length - 1);
            }
            return string;
        }

        public static function readln(prompt:String):String {
            Program.write(prompt);
            // unfortunately, Program.readLine() returns an empty string on EOF
            var input:String = fgets(0x7FFFFFFF, stdin);
            if (input != null) {
                return chomp(input);
            }
            return input;
        }

        public static function readWords(prompt:String):String {
            var word:String;
            var words:Array = new Array();
            while ((word = readln(prompt)) != null) {
                words.push(word);
            }
            return words;
        }

        public static function makeGreeter(target:String):Function {
            return function():void {
                trace('Hello ' + target + '!');
            }
        }

        public static function theAnswer():int {
            return (2 + 4) * 8 - 4 - 2;
        }

        public static function hostname():String {
            return chomp(FileSystem.read('/etc/hostname'));
        }

        public static function argv():Array {
            return Program.argv;
        }

        public static function failGracefully():String {
            try {
                throw new CustomError('Test', 42);
            } catch (error:CustomError) {
                return error.message + ' ' + error.errorID;
            }
        }

        public static function splat(func:Function, args:Array):* {
            return func.apply(null, args);
        }

        public static function tokenize(input:String):Array {
            var re:RegExp = /\s*([0-9]+|[-()+*/])/g;
            var tokens:Array = new Array();
            var match:Array = re.exec(input);

            while (match != null) {
                tokens.push(match[1]);
                match = re.exec(input);
            }
            return tokens;
        }

        public static function keys(object:Object):Array {
            var result:Array = new Array();
            for (var key in object) {
                result.push(key);
            }
            return result;
        }

        // rect

        public static function now():int {
            return Program.getTimer();
        }
    }
}

