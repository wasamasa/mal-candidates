#include <emacs-module.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <readline/readline.h>
#include <readline/history.h>

int plugin_is_GPL_compatible;

static void bind_function(emacs_env *env, const char *name, emacs_value Sfun) {
    emacs_value Qfset = env->intern(env, "fset");
    emacs_value Qsym = env->intern(env, name);
    emacs_value args[] = { Qsym, Sfun };
    env->funcall(env, Qfset, 2, args);
}

static void provide(emacs_env *env, const char *feature) {
    emacs_value Qfeat = env->intern(env, feature);
    emacs_value Qprovide = env->intern (env, "provide");
    emacs_value args[] = { Qfeat };
    env->funcall(env, Qprovide, 1, args);
}

static emacs_value Freadline(emacs_env *env, ptrdiff_t nargs, emacs_value args[], void *data) {
    ptrdiff_t len;
    char *prompt, *line;
    emacs_value ret;
    emacs_value Qnil = env->intern(env, "nil");

    if (!env->copy_string_contents(env, args[0], NULL, &len)) {
        return Qnil;
    }

    prompt = malloc(len);
    if (!prompt) {
        return Qnil;
    }

    if (!env->copy_string_contents(env, args[0], prompt, &len)) {
        return Qnil;
    }

    line = readline(prompt);
    if (!line) {
        return Qnil;
    }

    ret = env->make_string(env, line, strlen(line));
    free(line);
    return ret;
}

static emacs_value Fadd_history(emacs_env *env, ptrdiff_t nargs, emacs_value args[], void *data) {
    ptrdiff_t len;
    char *line;
    emacs_value Qnil = env->intern(env, "nil");
    emacs_value Qt = env->intern(env, "t");

    if (!env->copy_string_contents(env, args[0], NULL, &len)) {
        return Qnil;
    }

    line = malloc(len);
    if (!line) {
        return Qnil;
    }

    if (!env->copy_string_contents(env, args[0], line, &len)) {
        return Qnil;
    }

    add_history(line);
    free(line);
    return Qt;
}

int emacs_module_init(struct emacs_runtime *ert) {
    emacs_env *env = ert->get_environment(ert);
    bind_function(env, "readline", env->make_function(env, 1, 1, Freadline, NULL, NULL));
    bind_function(env, "add-history", env->make_function(env, 1, 1, Fadd_history, NULL, NULL));
    provide(env, "readline");
    return 0;
}
