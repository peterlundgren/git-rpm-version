DESTDIR?=/
PREFIX?=/usr/local

all: check

test/assert.sh/assert.sh:
	$(error assert.sh submodule is missing \
	        (use "git submodule update --init" \
	        to clone the missing submodules))

.PHONY: check test
test: check
check: test/assert.sh/assert.sh
	@cd test && ./run-tests

.PHONY: install
install:
	install -D -m 755 git-rpm-version ${DESTDIR}${PREFIX}/bin
