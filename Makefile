MIX = mix
CFLAGS = -g -O3 -ansi -pedantic -Wall -Wextra
ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
ERL_INTERFACE_PATH = $(shell erl -eval 'io:format("~s", [code:lib_dir(erl_interface, lib)])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)
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
		LDFLAGS += -L$(ERL_INTERFACE_PATH)
		LDFLAGS += -lerl_interface 
	endif

	LDFLAGS += -shared 
endif



.PHONY: all talib clean

all: 
	$(CC) -c $(CFLAGS) -o c_src/talib.o c_src/talib.c
	$(CC) -c $(CFLAGS) -o c_src/util.o c_src/util.c
	$(CC) c_src/util.o c_src/talib.o $(LDFLAGS) -o priv/talib.so

clean:
	$(MIX) clean
	$(RM) c_src/*.o
	$(RM) priv/*.so