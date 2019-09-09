PREFIX ?= /usr/local

default: install
install:
	mkdir -p $(PREFIX)/twopi_roots
	mkdir -p $(PREFIX)/twopi_roots/TwoPi
	cp -r bin $(PREFIX)/twopi_roots/TwoPi/
	cp -r scripts $(PREFIX)/twopi_roots/TwoPi/
	cp -r externals $(PREFIX)/twopi_roots/TwoPi/
	cp -r extra $(PREFIX)/twopi_roots/TwoPi/

