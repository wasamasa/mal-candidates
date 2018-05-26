#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <readline/readline.h>

/* HACK: Cim's FFI can't deal with empty strings, so either return a
 * sentinel string for EOF or a newline-terminated one */
extern char *gnu_readline(char *prompt) {
    char *line = readline((const char*) prompt);
    if (line == NULL) {
        line = strdup("\x04");
    } else {
        size_t len = strlen((const char*) line);
        line = realloc(line, len + 2);
        line[len] = '\n';
        line[len+1] = '\0';
    }
    return line;
}
