include 'util.as3';

function sum(...args:Array):int {
    var sum:int = 0;
    for each (var arg in args) {
        sum += arg;
    }
    return sum;
}

var then:int = Util.now();
var dict:Object = { foo: 1, bar: 2 };
var r1:Rect = new Rect(6);
trace('Reading words...');
trace('Words: ' + Util.readWords('> '));
trace('The answer: ' + Util.theAnswer());
Util.makeGreeter('World')();
trace('Hostname: ' + Util.hostname());
trace('ARGV: ' + Util.argv());
trace('Error: ' + Util.failGracefully());
trace('Sum: ' + Util.splat(sum, [1, 2, 3, 4]));
trace('Tokens: ' + Util.tokenize('1 * (2 * 3) + 4'));
trace('Keys: ' + Util.keys(dict));
trace('Rect r1 size: ' + r1.size);
trace('Doubling rect size...');
r1.size *= 2;
trace('Rect r1 size: ' + r1.size);
trace('Elapsed time: ' + (Util.now() - then) + 'ms');
