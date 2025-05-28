MIX = mix
CFLAGS = -g -O3 -ansi -pedantic -Wall -Wextra
ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
EI_PATH = $(shell erl -eval 'io:format("~s", [code:lib_dir(ei, lib)])' -s init stop -noshell)
FILES =  $(shell ls c_src/*.c)
CFLAGS += -I$(ERLANG_PATH)
CFLAGS += -Wno-unused-parameter
CC= gcc
LDFLAGS += -lta_lib

ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC

	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
		CFLAGS  += -I/opt/homebrew/Cellar/ta-lib/0.4.0/include/ta-lib/
		LDFLAGS += -L/opt/homebrew/Cellar/ta-lib/0.4.0/lib/
	endif

	ifeq ($(shell uname),Linux)
		CFLAGS  += -I/usr/include/ta-lib
		LDFLAGS += -L/usr/lib
		LDFLAGS += -L$(EI_PATH)
		LDFLAGS += -lei
	endif

	LDFLAGS += -shared
endif

.PHONY: all clean

all:
	@mkdir -p priv
	$(CC) $(CFLAGS) $(FILES) $(LDFLAGS) -o priv/talib.so

clean:
	$(MIX) clean
	$(RM) priv/*.so