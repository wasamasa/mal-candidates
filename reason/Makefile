.PHONY: all clean

all: src/Test.bs.js

node_modules:
	npm install

src/Test.bs.js: src/Util.re src/Util.rei src/Test.re
	npm run-script build

clean:
	npm run-script clean
