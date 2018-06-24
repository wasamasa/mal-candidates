#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

#include <gc.h>

#include "util.h"

#define MAX_STRING_LENGTH 256

struct form *make_lisp_string(char *s) {
    struct form *ret = GC_MALLOC(sizeof(struct form));
    ret->type = STRING;
    ret->data.s = s;
    return ret;
}

struct form *make_lisp_int(int i) {
    struct form *ret = GC_MALLOC(sizeof(struct form));
    ret->type = INT;
    ret->data.i = i;
    return ret;
}

struct form *make_lisp_nil() {
    struct form *ret = GC_MALLOC(sizeof(struct form));
    ret->type = CELL;
    ret->data.c = NULL;
    return ret;
}

int is_pair(struct form *x) {
    return x->type == CELL && x->data.c != NULL;
}

struct form *cons(struct form *x, struct form *y) {
    struct form *ret = GC_MALLOC(sizeof(struct form));
    ret->type = CELL;
    ret->data.c = GC_MALLOC(sizeof(struct form));
    ret->data.c->ar = x;
    ret->data.c->dr = y;
    return ret;
}

struct form *car(struct form *l) {
    assert(l->type == CELL);
    return l->data.c->ar;
}

struct form *cdr(struct form *l) {
    assert(l->type == CELL);
    return l->data.c->dr;
}

struct form *reverse_list(struct form *l) {
    struct form *ret = make_lisp_nil();
    assert(l->type == CELL);
    while (is_pair(l)) {
        ret = cons(car(l), ret);
        l = cdr(l);
    }
    return ret;
}

void print_string_list(struct form *l) {
    int printsep = 0;
    assert(l->type == CELL);
    printf("(");
    while (is_pair(l)) {
        if (printsep) {
            printf(", ");
        }
        struct form *tmp = car(l);
        assert(tmp->type == STRING);
        printf("\"%s\"", tmp->data.s);
        l = cdr(l);
        printsep = 1;
    }
    printf(")");
}

char *resize_string(char *buf, int new_size) {
    char *ret = GC_MALLOC(new_size + 1);
    strncpy(ret, buf, new_size + 1);
    return ret;
}

void chomp(char *buf) {
    int len = (buf == NULL) ? 0 : strlen(buf);
    if (len > 0 && buf[len-1] == '\n') {
        buf[len-1] = '\0';
    }
}

char *read_word(const char *prompt) {
    printf("%s", prompt);
    char *buf = GC_MALLOC(MAX_STRING_LENGTH);
    char *ret = fgets(buf, MAX_STRING_LENGTH, stdin);

    if (feof(stdin) && ret == NULL) {
        return NULL;
    } else if (ret == NULL) {
        buf[MAX_STRING_LENGTH-1] = '\0';
    } else {
        buf = resize_string(buf, strlen(buf));
    }

    chomp(buf);
    return buf;
}

struct form *read_words(const char *prompt) {
    struct form *words = make_lisp_nil();
    char *word;
    while ((word = read_word(prompt)) != NULL) {
        words = cons(make_lisp_string(word), words);
    }
    return reverse_list(words);
}

int the_answer() {
    return 4 * 10 + 8 / 4;
}

char *hostname() {
    FILE* f = fopen("/etc/hostname", "r");
    char *buf = GC_MALLOC(MAX_STRING_LENGTH);

    if (fgets(buf, MAX_STRING_LENGTH, f) == NULL) {
        buf[MAX_STRING_LENGTH-1] = '\0';
    } else {
        buf = resize_string(buf, strlen(buf));
    }

    fclose(f);
    chomp(buf);
    return buf;
}

struct form *argv_(int argc, char **argv) {
    struct form *args = make_lisp_nil();
    for (int i = 1; i < argc; ++i) {
        args = cons(make_lisp_string(argv[i]), args);
    }
    return reverse_list(args);
}

int is_space(char c) {
    return (c == ' ' || c == '\t' || c == '\n');
}

int is_digit(char c) {
    return (c >= '0' && c <= '9');
}

int is_special(char c) {
    return (c == '+' || c == '-' || c == '*' ||
            c == '/' || c == '(' || c == ')');
}

int read_whitespace(char *input) {
    int i = 0;
    while (is_space(*input++)) {
        i++;
    }
    return i;
}

int read_digits(char *input) {
    int i = 0;
    while (is_digit(*input++)) {
        i++;
    }
    return i;
}

struct form *tokenize(const char *input) {
    struct form *tokens = make_lisp_nil();
    char *token, *s = (char *) input;
    char c;
    int len;
    while ((c = *s)) {
        if (is_space(c)) {
            s += read_whitespace(s);
        } else if (is_digit(c)) {
            len = read_digits(s);
            token = GC_MALLOC(len + 1);
            strncpy(token, s, len);
            tokens = cons(make_lisp_string(token), tokens);
            s += len;
        } else if (is_special(c)) {
            len = 1;
            token = GC_MALLOC(len + 1);
            strncpy(token, s, len);
            tokens = cons(make_lisp_string(token), tokens);
            s++;
        } else {
            printf("unknown character: %c\n", c);
            abort();
        }
    }
    return reverse_list(tokens);
}

struct form *keys(struct form *dict) {
    assert(dict->type == CELL);
    struct form *ret = make_lisp_nil();
    while (is_pair(dict)) {
        struct form *tmp = car(dict);
        assert(tmp->type == CELL);
        struct form *key = car(tmp);
        assert(key->type == STRING);
        ret = cons(key, ret);
        dict = cdr(dict);
    }
    return reverse_list(ret);
}

static struct timeval t0;
static int t0_initialized = 0;

double now() {
    struct timeval t1;
    if (!t0_initialized) {
        gettimeofday(&t0, NULL);
        t0_initialized = 1;
    }
    gettimeofday(&t1, NULL);
    return (t1.tv_sec - t0.tv_sec) * 1000 + (t1.tv_usec - t0.tv_usec) / 1000.0;
}
