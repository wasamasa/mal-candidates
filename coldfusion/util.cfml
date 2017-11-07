<cfscript>
function j(class) {
    return createObject('java', class);
}

stdin = j('java.lang.System').in;
stdout = j('java.lang.System').out;
stdinReader = j('java.io.BufferedReader').init(j('java.io.InputStreamReader')
                                         .init(stdin));
args = j('java.lang.System').getenv('CFML_ARGS');

function print(thing) {
    stdout.print(thing);
}

function println(thing) {
    stdout.println(thing);
}

function readln(prompt) {
    print(prompt);
    var input = stdinReader.readLine();
    if (isNull(input)) {
        return false;
    } else {
        return input;
    }
}

function readWords(prompt) {
    var words = [];
    while (true) {
        var word = readln(prompt);
        if (word == false) {
            break;
        }
        words.append(word);
    }
    return words;
}

function theAnswer() {
    return 3 * 2 * (3 + 4);
}

function makeGreeter(target) {
    return function() {
        return 'Hello ' & target & '!';
    };
}

function hostname() {
    return trim(fileRead('/etc/hostname'));
}

function argv() {
    return listToArray(args, chr(12));
}

function failGracefully() {
    try {
        throw(type='Custom', message='Test', detail='42')
    } catch (custom ex) {
        return [ex.message, ex.detail];
    }
}

function splat(op, args) {
    return op(argumentCollection=arrayToStruct(args));
}

function tokenize(input) {
    var tokens = reMatch('[[:space:]]*([-()+*/]|\d+)', input);
    var result = []
    for (token in tokens) {
        result.append(trim(token));
    }
    return result;
}

function keys(dict) {
    return dict.keyArray();
}

function _now() {
    return GetTickCount();
}
</cfscript>
