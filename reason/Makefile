.PHONY: all clean

all: src/Test.bs.js src/Repl.bs.js

node_modules:
	npm install

src/Test.bs.js: src/Util.re src/Util.rei src/readline.js src/Test.re
	npm run-script build

src/Repl.bs.js: src/Repl.re src/readline.js
	npm run-script build

clean:
	npm run-script clean
