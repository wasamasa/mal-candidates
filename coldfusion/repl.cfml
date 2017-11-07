<cfscript>
function j(class) {
    return createObject('java', class);
}

// HACK: this uses the bundled jline2 library
reader = j('jline.console.ConsoleReader').init();
stdout = j('java.lang.System').out;
home = j('java.lang.System').getProperty('user.home');
historyPath = home & '/.mal_history';
historyFile = j('java.io.File').init(historyPath);

function readln(prompt) {
    var input = reader.readLine(prompt);
    if (isNull(input)) {
        return false;
    } else {
        return input;
    }
}

function println(thing) {
    stdout.println(thing);
}

function repl(prompt) {
    if (!historyFile.exists()) {
        historyFile.createNewFile();
    }

    var history = j('jline.console.history.FileHistory').init(historyFile);
    reader.setHistory(history);

    while(true) {
        var input = readln(prompt);
        if (input == false) {
            break;
        }
        println(input);
        history.flush();
    }
}

repl('> ');
</cfscript>
