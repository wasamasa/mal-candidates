implement Util;
include "sys.m";
    sys: Sys;
include "bufio.m";
    bufio: Bufio;
    Iobuf: import bufio;
include "regex.m";
    regex: Regex;
include "lists.m";
    lists: Lists;
include "util.m";

init()
{
    sys = load Sys Sys->PATH;
    bufio = load Bufio Bufio->PATH;
    regex = load Regex Regex->PATH;
    lists = load Lists Lists->PATH;
}

join(strings: list of string, sep: string): string
{
    if (strings == nil) return "";
    output := hd strings;
    strings = tl strings;
    for (; strings != nil; strings = tl strings)
    {
        output += sep;
        output += hd strings;
    }
    return output;
}

gets(prompt: string): string
{
    stdin := sys->fildes(0);
    sys->print("%s", prompt);
    buf := bufio->fopen(stdin, bufio->OREAD);
    input := buf.gets('\n');
    if (input != nil)
        return input[:len input - 1];
    return nil;
}

readWords(prompt: string): list of string
{
    words : list of string;
    while ((word := gets(prompt)) != nil)
        words = word::words;
    return words;
}

theAnswer(): int
{
    return 6 * 6 + 6;
}

hostname(): string
{
    buf := bufio->open("/dev/sysname", bufio->OREAD);
    # we'll just assume hostnames don't ever contain null bytes...
    hostname := buf.gets('\0');
    return hostname;
}

failGracefully(): string
{
    { raise CUSTOM("test", 42); } exception e {
    CUSTOM =>
        (reason, num) := e;
        result := sys->sprint("%s %d", reason, num);
        return result;
    }
}

tokenize(input: string): list of string
{
    tokens : list of string;
    (re, nil) := regex->compile("[ \n]*([+\\-*/()]|[0-9]+)", 1);
    i := 0;
    while((i < len input) &&
          (match := regex->executese(re, input, (i, len input), 0, 0)) != nil)
    {
        (beg, end) := match[1];
        token := input[beg:end];
        tokens = token::tokens;
        i = end;
    }
    return lists->reverse(tokens);
}

keys(dict: Dict): list of string
{
    result : list of string;
    items := dict.items;
    for (i := 0; i < len items; i++)
    {
        bucket := items[i];
        for (; bucket != nil; bucket = tl bucket)
        {
            (key, nil) := hd bucket;
            result = key::result;
        }
    }
    return result;
}

now(): int
{
    return sys->millisec();
}
