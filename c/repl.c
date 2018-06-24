#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <readline/readline.h>
#include <readline/history.h>

#define MAX_STRING_LENGTH 256
char history_file[MAX_STRING_LENGTH];

void chomp(char *buf) {
    int len = (buf == NULL) ? 0 : strlen(buf);
    if (len > 0 && buf[len-1] == '\n') {
        buf[len-1] = '\0';
    }
}

void load_history() {
    char line[MAX_STRING_LENGTH];
    FILE *f = fopen(history_file, "r");
    if (f != NULL) {
        while(1) {
            char *ret = fgets(line, MAX_STRING_LENGTH, f);
            if (feof(f) && ret == NULL) {
                break;
            } else if (ret == NULL) {
                line[MAX_STRING_LENGTH-1] = '\0';
            }

            chomp(line);
            add_history(line);
        }
        fclose(f);
    }
}

int is_blank(char *line) {
    if (line == NULL) {
        return 1;
    }

    int len = strlen(line);
    int blank_len = strspn(line, " \t\n");
    return (len == blank_len);
}

void append_line(char *path, char *line) {
    FILE* f = fopen(path, "a");
    if (f != NULL) {
        fprintf(f, "%s\n", line);
        fclose(f);
    }
}

void add_to_history(char *line) {
    if (!is_blank(line)) {
        add_history(line);
        append_line(history_file, line);
    }
}

void repl(char *prompt) {
    char *line;
    load_history();
    while ((line = readline(prompt)) != NULL) {
        if (!is_blank(line)) {
            printf("%s\n", line);
            add_to_history(line);
        }
        free(line);
    }
    printf("\n");
}

int main() {
    char *home = getenv("HOME");
    char *path = "/.mal_history";
    assert(home != NULL);
    snprintf(history_file, MAX_STRING_LENGTH, "%s%s", home, path);
    repl("> ");
    return 0;
}
