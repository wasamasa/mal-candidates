#include <string.h>
#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>

#include "icall.h"

int Creadline(int argc, descriptor *argv) {
    ArgString(1);
    char *ret = readline(StringVal(argv[1]));
    if (ret == NULL) {
        Fail;
    } else {
        RetAlcString(ret, strlen(ret));
    }
}

int Cadd_history(int argc, descriptor *argv) {
    ArgString(1);
    add_history(StringVal(argv[1]));
    RetNull();
}
