#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <readline/readline.h>
#include <readline/history.h>

void Freadline(char *prompt, char *buf, int buf_size, int *line_size) {
    char *ret = readline((const char*) prompt);
    if (ret == NULL) {
        *line_size = -1;
    } else {
        *line_size = strlen(ret);
        if (*line_size > buf_size) {
            *line_size = buf_size;
        }
        strncpy(buf, ret, buf_size);
        free(ret);
    }
}
