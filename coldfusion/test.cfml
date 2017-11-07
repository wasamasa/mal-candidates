<cfscript>
include 'util.cfml';

then = _now();

function add() {
    return arrayReduce(Arguments, function(result, item) {
        return result + item;
    }, 0);
}

dict = {'foo' = 1, 'bar' = 2};
r1 = new Rect(6);

println('Reading words...');
println('Words: ' & readWords('> ').toList(', '));
println('The answer: ' & toString(theAnswer()));
greeter = makeGreeter("World");
println(greeter());
println('Hostname: ' & hostname());
println('ARGV: ' & argv().toList(', '));
println('Error: ' & failGracefully().toList(', '));
println('Sum: ' & toString(splat(add, [1, 2, 3, 4])));
println('Tokens: ' & tokenize('1 * (2 * 3) + 4').toList(', '));
println('Keys: ' & keys(dict).toList(', '));
println('Rect r1 size: ' & r1.getSize());
println('Doubling rect size...')
r1.setSize(r1.getSize() * 2);
println('Rect r1 size: ' & r1.getSize());
println('Elapsed time: ' & toString(_now() - then) & 'ms');
</cfscript>
