/* HACK: Cim only offers an argv pointer, no procedure to access it */
extern char *get_arg(char **argv, unsigned long i) {
    return argv[i];
}
