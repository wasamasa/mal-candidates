#include <slang.h>
#include <readline/readline.h>
#include <readline/history.h>

SLANG_MODULE(readline);

static void _rl_readline(char *prompt) {
    char *line = readline(prompt);

    if (!line) {
        SLang_push_null();
        return;
    }

    SLang_push_malloced_string(line);
}

static void _rl_add_history(char *line) {
    add_history(line);
    return;
}

static SLang_Intrin_Fun_Type readline_intrinsics [] = {
    MAKE_INTRINSIC_1("rl_readline", _rl_readline,
                     SLANG_VOID_TYPE, SLANG_STRING_TYPE),
    MAKE_INTRINSIC_1("rl_add_history", _rl_add_history,
                     SLANG_VOID_TYPE, SLANG_STRING_TYPE),
    SLANG_END_INTRIN_FUN_TABLE
};

int init_readline_module_ns(char *ns_name) {
    SLang_NameSpace_Type *ns = SLns_create_namespace(ns_name);
    if (!ns)
        return -1;
    if (SLns_add_intrin_fun_table(ns, readline_intrinsics, "__RL__") == -1)
        return -1;

    return 0;
}

void deinit_readline_module(void) { }
