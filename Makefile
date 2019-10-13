PREFIX ?= /usr/local

# Params:
#   1. Variable name(s) to test.
#   2. (optional) Error message to print.
check_defined = \
    $(strip $(foreach 1,$1, \
        $(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
    $(if $(value $1),, \
      $(error Undefined $1$(if $2, ($2))))

default: install
install_activation:
	@:$(call check_defined, TwoPiDevice, TwoPiDevice Name)
	@:$(call check_defined, TwoPiRoot, TwoPiRoot Name)
	echo "Copying Activation to "$(TwoPiRoot)/bin

	@if [ ! -f src/scripts/activation_scripts/activate_twop_${TwoPiDevice} ];then \
	     echo "installing generic activation script";\
	     cp -f scripts/activation_scripts/activate_twopi_default ${TwoPiRoot}/bin/activate_twopi; \
	else \
	     cp -f scripts/activation_scripts/activate_twopi_${TwoPiDevice} ${TwoPiRoot}/bin/activate_twopi;\
	fi

install:
	mkdir -p $(PREFIX)
	mkdir -p $(PREFIX)/TwoPi
	cp -rf bin $(PREFIX)/TwoPi/
	cp -rf scripts $(PREFIX)/TwoPi/
	cp -rf externals $(PREFIX)/TwoPi/
	cp -rf extra $(PREFIX)/TwoPi/

