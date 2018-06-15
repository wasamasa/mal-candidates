#include <aikido.h>

extern "C" {
#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>

AIKIDO_NATIVE(readline_) {
    const char *prompt = (paras[0].str)->c_str();
    char *buf = readline(prompt);
    if (buf == NULL) {
        return aikido::Value(); // None
    } else {
        aikido::string *result = new aikido::string(buf);
        free(buf);
        return result;
    }
}

AIKIDO_NATIVE(addHistory) {
    const char *line = (paras[0].str)->c_str();
    add_history(line);
    return 0;
}

}
