#include <spl.h>
#include <errno.h>
#include <string.h>
#include <readline/readline.h>
#include <readline/history.h>

static struct spl_node *handler_rl_readline(struct spl_task *task, void *data) {
    char *prompt = spl_clib_get_string(task);
    return SPL_NEW_STRING(readline(prompt));
}

static struct spl_node *handler_rl_add_history(struct spl_task *task, void *data) {
    char *line = spl_clib_get_string(task);
    add_history(line);
    return 0;
}

void SPL_ABI(spl_mod_readline_init)(struct spl_vm *vm, struct spl_module *mod, int restore) {
    if (!restore)
        spl_eval(vm, 0, strdup(mod->name), "object ReadlineEx { }");

    spl_clib_reg(vm, "rl_readline", handler_rl_readline, 0);
    spl_clib_reg(vm, "rl_add_history", handler_rl_add_history, 0);
}

void SPL_ABI(spl_mod_readline_done)(struct spl_vm *vm, struct spl_module *mod) {
    return;
}
