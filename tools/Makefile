# Tools Makefile — regenerates all code from ta-lib's introspection API
#
# Usage:
#   make -C tools generate    # Full pipeline: introspect ta-lib → JSON → FunctionDef → C/Elixir code
#   make -C tools json        # Dump ta-lib function metadata to JSON only
#   make -C tools clean       # Remove build artifacts

# Detect ta-lib location
TA_LIB_CFLAGS := $(shell pkg-config --cflags ta_lib 2>/dev/null)
TA_LIB_LIBS := $(shell pkg-config --libs ta_lib 2>/dev/null)

ifeq ($(TA_LIB_CFLAGS),)
  TA_LIB_PREFIX := $(shell brew --prefix ta-lib 2>/dev/null)
  ifneq ($(TA_LIB_PREFIX),)
    TA_LIB_CFLAGS := -I$(TA_LIB_PREFIX)/include/ta-lib
    TA_LIB_LIBS := -L$(TA_LIB_PREFIX)/lib -lta-lib
  else
    TA_LIB_CFLAGS := -I/usr/include/ta-lib
    TA_LIB_LIBS := -lta-lib
  endif
endif

CC ?= cc
MIX ?= mix

.PHONY: generate json clean

generate: talib_functions.json
	elixir generate_function_def.exs
	cd .. && $(MIX) talib

talib_introspect: talib_introspect.c
	$(CC) -o $@ $< $(TA_LIB_CFLAGS) $(TA_LIB_LIBS) -lm

json: talib_introspect
	./talib_introspect > talib_functions.json

talib_functions.json: talib_introspect
	./talib_introspect > $@

clean:
	$(RM) talib_introspect talib_functions.json
