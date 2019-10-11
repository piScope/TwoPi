PREFIX ?= /usr/local

default: install
install:
	mkdir -p $(PREFIX)
	mkdir -p $(PREFIX)/TwoPi
	cp -r bin $(PREFIX)/TwoPi/
	cp -r scripts $(PREFIX)/TwoPi/
	cp -r externals $(PREFIX)/TwoPi/
	cp -r extra $(PREFIX)/TwoPi/

