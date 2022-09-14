# TalibEx

Nif Implementation for TA-LIB.

It will use system installed TA-LIB

## Generated files

- All files in `c_src` (expect `util.c` and `util.h`) are generated
- `lib/nif.ex` is generated
- `lib/talib_ex.ex` is generated
- `priv/talib.so` is generated

## Mix task to generate files

The module `Mix.Tasks.Talib` is responsible for generating the files
The module `TalibEx.FunctionDef` holds the mapping information

## To Generate files and build c src and generate the nif moduke

```sh
mix talib && make clean && make
```

## Install TA-LIB (Ubunut)

```sh
apt-get update
apt-get install gcc build-essential wget
wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar -zxvf ta-lib-0.4.0-src.tar.gz
rm ta-lib-0.4.0-src.tar.gz
cd ta-lib
./configure --prefix=/usr
make
make install
cd ../
rm -rf ta-lib
```

## Install TA-LIB (Mac OS)

```sh
brew install ta-lib
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `talib_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:talib_ex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/talib_ex>.
