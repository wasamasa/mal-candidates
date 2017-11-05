tic();

define seq_join(list, sep) {
    variable item, i = 0, representation = "";
    foreach item (list) {
        if (i != 0) {
            representation += sep;
        }
        representation += make_printable_string(string(item));
        i++;
    }

    return representation;
}

define readline(prompt) {
    variable line;
    () = fputs(prompt, stdout);
    () = fflush(stdout);

    if (fgets(&line, stdin) == -1)
        return NULL;
    return strtrim(line);
}

define read_words(prompt) {
    variable word, words = {};
    while (word = readline(prompt), word != NULL) {
        list_insert(words, word);
    }

    list_reverse(words);
    return words;
}

define the_answer() {
    return (1 + 4 * 5) * 2;
}

% make_greeter is impossible to do because there are no closures or
% anonymous functions

define hostname() {
    variable line;
    variable fp = fopen("/etc/hostname", "r");
    if (fp == NULL)
        return 0;

    if (fgets(&line, fp) == -1)
        return 0;

    () = fclose(fp);
    return strtrim(line);
}

define argv() {
    variable args = String_Type[length(__argv) - 1];
    variable i;
    for (i = 1; i < length(__argv); i++)
        args[i-1] = __argv[i];
    return args;
}

new_exception("CustomError", RunTimeError, "Custom error class");

define fail_gracefully() {
    variable ex;
    try (ex) {
        throw CustomError, "Test", 42;
    }
    catch CustomError: {
        return (ex.message, ex.object);
    }
}

define splat(op, args) {
    % NOTE: this only works with fixed-arity functions as _NARGS is
    % unset and actual variadic functions relying on it will fail
    list_reverse(args);
    __push_list(args);
    return @op();
}

define tokenize(input) {
    variable tokens = {}, i = 1, limit = strlen(input), pos, len;
    variable re = " *\\([-()+*/0-9]\\)";
    while (i <= limit) {
        pos = string_match(input, re, i);
        if (pos == 0)
            i = limit + 1;
        else {
            (pos, len) = string_match_nth(1);
            pos += 1;
            list_insert(tokens, substr(input, pos, len));
            i = pos + len;
        }
    }
    list_reverse(tokens);
    return tokens;
}

define keys(dict) {
    return assoc_get_keys(dict);
}

typedef struct { size } Rect_Type;

define now() {
    return toc();
}
