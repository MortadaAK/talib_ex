MIX = mix
CFLAGS = -g -O3 -Wall -Wextra -Wno-unused-parameter -fPIC
ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)

FILES = $(wildcard c_src/*.c)

# Use CC from environment if set (cc_precompiler sets this for cross-compilation)
CC ?= gcc

# When TA_LIB_DIR is set (CI static builds), use it directly.
# Otherwise fall back to pkg-config, then common system paths.
ifdef TA_LIB_DIR
	CFLAGS += -I$(TA_LIB_DIR)/include/ta-lib
	TA_LIB_STATIC = $(TA_LIB_DIR)/lib/libta-lib.a
	LINK_TA_LIB = $(TA_LIB_STATIC)
else ifneq ($(shell pkg-config --exists ta_lib 2>/dev/null && echo yes),)
	CFLAGS += $(shell pkg-config --cflags ta_lib)
	LINK_TA_LIB = $(shell pkg-config --libs ta_lib)
else ifneq ($(shell brew --prefix ta-lib 2>/dev/null),)
	TA_LIB_BREW = $(shell brew --prefix ta-lib)
	CFLAGS += -I$(TA_LIB_BREW)/include/ta-lib
	LINK_TA_LIB = -L$(TA_LIB_BREW)/lib -lta-lib
else
	# Fallback for systems without pkg-config or brew
	LINK_TA_LIB = -lta-lib
	ifeq ($(shell uname),Linux)
		CFLAGS += -I/usr/include/ta-lib
	endif
endif

LDFLAGS =

ifneq ($(OS),Windows_NT)
	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
	else
		LDFLAGS += -shared
		EI_PATH = $(shell erl -eval 'io:format("~s", [code:lib_dir(ei, lib)])' -s init stop -noshell)
		LDFLAGS += -L$(EI_PATH) -lei
	endif
endif

.PHONY: all clean

all:
	@mkdir -p priv
	$(CC) $(CFLAGS) $(FILES) $(LINK_TA_LIB) $(LDFLAGS) -o priv/talib.so -lm

clean:
	$(MIX) clean
	$(RM) priv/*.so
