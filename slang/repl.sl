import("readline");

variable history_file = "$HOME/.mal_history"$;

define is_blank(line) {
    return string_match(line, "^[ \t\n]*$");
}

define load_history() {
    variable fp = fopen(history_file, "r");
    if (fp == NULL)
        return -1;

    variable lines = fgetslines(fp);
    if (lines == NULL)
        return -1;

    variable line;
    foreach line (lines)
        if (is_blank(line) == 0)
            rl_add_history(strtrim(line));

    fclose(fp);
}


define append_line_to_history(line) {
    variable fp = fopen(history_file, "a");
    if (fp == NULL)
        return -1;

    fputs(line + "\n", fp);
    fclose(fp);
}

define add_to_history(line) {
    rl_add_history(line);
    append_line_to_history(line);
}

define repl(prompt) {
    load_history();

    variable line;
    while (line = rl_readline(prompt), line != NULL) {
        if (is_blank(line) == 0) {
            message(line);
            add_to_history(line);
        }
    }
}

repl("> ");
message("");
