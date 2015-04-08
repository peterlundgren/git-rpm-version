DESTDIR?=/
PREFIX?=/usr/local

all: check

.PHONY: check test
test: check
check:
	@cd test && ./run-tests

.PHONY: install
install:
	install -D -m 755 git-rpm-version ${DESTDIR}${PREFIX}/bin
