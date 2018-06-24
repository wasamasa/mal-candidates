#include <stdarg.h>
#include <stdio.h>

#include <gc.h>

#include "util.h"

int main(int argc, char **argv) {
    double then = now();
    GC_INIT();
    struct form *dict =
        cons(cons(make_lisp_string("foo"), make_lisp_int(1)),
             cons(cons(make_lisp_string("bar"), make_lisp_int(2)),
                  make_lisp_nil()));
    struct rect r1 = {6};
    printf("Reading words...\n");
    printf("Words: ");
    print_string_list(read_words("> "));
    printf("\n");
    printf("The answer: %d\n", the_answer());
    // no closures
    printf("Hostname: %s\n", hostname());
    printf("ARGV: ");
    print_string_list(argv_(argc, argv));
    printf("\n");
    // no exceptions
    // va_lists are quite limited, so let's skip emulating splats
    printf("Tokens: ");
    print_string_list(tokenize("1 * (2 * 3) + 4"));
    printf("\n");
    printf("Keys: ");
    print_string_list(keys(dict));
    printf("\n");
    printf("Rect r1 size: %d\n", r1.size);
    printf("Doubling rect size...\n");
    r1.size *= 2;
    printf("Rect r1 size: %d\n", r1.size);
    printf("Elapsed time: %.2fms\n", now() - then);
    return 0;
}
