MIX = mix
CFLAGS = -g -O3 -ansi -pedantic -Wall -Wextra
ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
ERL_INTERFACE_PATH = $(shell erl -eval 'io:format("~s", [code:lib_dir(erl_interface, lib)])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)
CC= gcc
LDFLAGS += -lta_lib
# ifeq ($(wildcard deps/talib),)
# 	TALIB_PATH = ../talib
# else
# 	TALIB_PATH = deps/talib
# endif

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
		LDFLAGS += -L$(ERL_INTERFACE_PATH)
		LDFLAGS += -lerl_interface 
	endif

	LDFLAGS += -shared 
endif



.PHONY: all talib clean

all: priv/talib.so

c_src/%.o: c_src/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

priv/%.so:
	@mkdir -p priv
	$(CC) $< $(LDFLAGS) -o $@

priv/talib.so: c_src/talib.o


clean:
	$(MIX) clean
	$(RM) c_src/talib.o
	$(RM) priv/talib.so