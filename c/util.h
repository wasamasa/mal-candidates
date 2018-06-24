#ifndef util_h
#define util_h

enum form_type { STRING, INT, CELL };

struct cell;

struct form {
    int type;
    union {
        char *s;
        int i;
        struct cell *c;
    } data;
};

struct cell {
    struct form *ar;
    struct form *dr;
};

struct form *make_lisp_string(char *s);
struct form *make_lisp_int(int i);
struct form *make_lisp_nil();

int is_pair(struct form *x);
struct form *cons(struct form *x, struct form *y);
struct form *car(struct form *l);
struct form *cdr(struct form *l);
struct form *reverse_list(struct form *l);
void print_string_list(struct form *l);

struct form *read_words(const char *prompt);
int the_answer();
char *hostname();
struct form *argv_(int argc, char **argv);
struct form *tokenize(const char *input);
struct form *keys(struct form *dict);

struct rect {
    int size;
};

double now();

#endif
