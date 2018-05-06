implement Test;
include "draw.m";
include "sys.m";
include "util.m";

Test: module
{
    init: fn(ctxt: ref Draw->Context, argv: list of string);
};

init(ctxt: ref Draw->Context, args: list of string)
{
    argv := tl args;
    sys := load Sys Sys->PATH;
    util := load Util Util->PATH;
    util->init();
    tables = load Tables Tables->PATH;
    then := util->now();
    Rect: import util;
    dict := Strhash[string].new(0, nil);
    dict.add("a", "1");
    dict.add("b", "2");
    sys->print("Reading words...\n");
    sys->print("Words: %s\n", util->join(util->readWords("> "), ", "));
    sys->print("The answer: %d\n", util->theAnswer());
    # no makeGreeter because there's no anonymous functions
    sys->print("Hostname: %s\n", util->hostname());
    sys->print("ARGV: %s\n", util->join(argv, " "));
    sys->print("Error: %s\n", util->failGracefully());
    # no splat because variadic functions are limited to built-ins
    sys->print("Tokens: %s\n", util->join(util->tokenize("1 * (2 * 3) + 4"), ", "));
    sys->print("Keys: %s\n", util->join(util->keys(dict), ", "));
    r1 := Rect(6);
    sys->print("Rect r1 size: %d\n", r1.size);
    sys->print("Doubling rect size...\n");
    r1.size *= 2;
    sys->print("Rect r1 size: %d\n", r1.size);
    sys->print("Elapsed time: %dms\n", util->now() - then);
}