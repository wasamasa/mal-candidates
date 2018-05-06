Dict: type ref Strhash[string];
include "tables.m";
    tables: Tables;
    Strhash: import tables;

Util: module
{
    PATH: con "/mal/util.dis";
    CUSTOM: exception(string, int);
    init: fn();
    join: fn(strings: list of string, sep: string): string;
    readWords: fn(prompt: string): list of string;
    theAnswer: fn(): int;
    hostname: fn(): string;
    failGracefully: fn(): string;
    tokenize: fn(input: string): list of string;
    keys: fn(table: Dict): list of string;
    Rect: adt { size: int; };
    now: fn(): int;
};
