#include <obnc/OBNC.h>
#include "Readline.h"

#include <readline/readline.h>
#include <readline/history.h>
#include <stdio.h>
#include <stdlib.h>

int Readline_Readline_(const char prompt_[], OBNC_LONGI int prompt_len, char line_[], OBNC_LONGI int line_len)
{
	char *result = readline(prompt_);
	if (result == NULL) {
		return 0;
	} else {
		snprintf(line_, (size_t) line_len, "%s", result);
		free(result);
		return 1;
	}
}


void Readline_AddHistory_(const char line_[], OBNC_LONGI int line_len)
{
	add_history(line_);
}


void Readline_Init(void)
{
}
