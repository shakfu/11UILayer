MAX_PACKAGE := "$(HOME)/Documents/Max\ 8/Packages/11UILayer"

.PHONY: all build clean


all: build


build:
	@mkdir -p build && cd build && cmake .. && cmake --build .


clean:
	@rm -rf build externals

setup:
	@git submodule init
	@git submodule update
	@if ! [ -L "$(MAX_PACKAGE)" ]; then \
		ln -s "$(shell pwd)" "$(MAX_PACKAGE)" ; \
		echo "... symlink created" ; \
	else \
		echo "... symlink already exists" ; \
	fi
