/* LIBS: readline */
#include <unistd.h>
#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>

ssize_t libreadline$Creadline(char *s) {
    return (ssize_t) readline(s);
}

ssize_t libreadline$Cadd_history(char *s) {
    add_history(s);
}
