INTERFACE Readline;
FROM Ctypes IMPORT char_star;

<*EXTERNAL*> PROCEDURE readline(prompt: char_star): char_star;
PROCEDURE Readline(prompt: TEXT): TEXT;

<*EXTERNAL*> PROCEDURE add_history(line: char_star);
PROCEDURE AddHistory(line: TEXT);

END Readline.
