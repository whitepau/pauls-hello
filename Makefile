ifndef CROSS_COMPILE
	CROSS_COMPILE:=
endif

ifndef ARCH
	ARCH=x86-64
endif

# use this macro to get absolute paths to source files, useful for out-of-source
# building.
ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY all: hello-report.txt
.PHONY clean:
	rm hello hello-report.txt

hello: ${ROOT_DIR}hello.cpp
	${CROSS_COMPILE}g++ -march=${ARCH} $^ -o $@

hello-report.txt: hello
	file $^ > $@