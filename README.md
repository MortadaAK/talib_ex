# TalibEx

NIF wrapper for [TA-Lib](https://github.com/TA-Lib/ta-lib) (Technical Analysis Library).

Precompiled binaries are provided for macOS and Linux (x86_64 and aarch64), so most users do not need TA-Lib or a C compiler installed.

## Installation

Add `talib_ex_nif` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:talib_ex_nif, "~> 0.6.4"}
  ]
end
```

A precompiled NIF will be downloaded automatically. If no precompiled binary is available for your platform, it falls back to compiling from source (requires TA-Lib and a C compiler).

## Usage

```elixir
TalibEx.sma(values: [1.0, 2.0, 3.0, 4.0, 5.0], time_period: 3)
#=> {:ok, [:nan, :nan, 2.0, 3.0, 4.0]}

TalibEx.rsi(values: [44.0, 44.25, 44.5, 43.75, 44.5, 44.25, 43.5], time_period: 5)
#=> {:ok, [:nan, :nan, :nan, :nan, :nan, 47.37, 30.77]}

TalibEx.bbands(values: [1.0, 2.0, 3.0, 4.0, 5.0], time_period: 3, deviations_up: 2.0, deviations_down: 2.0)
#=> {:ok, upper_band, middle_band, lower_band}
```

All 161 TA-Lib functions are supported, including momentum indicators, overlap studies, volatility, volume, candlestick patterns, and math operators.

## Building from source

If the precompiled binary is not available, the build requires TA-Lib headers and library installed on your system.

### macOS

```sh
brew install ta-lib
```

### Linux (Ubuntu/Debian)

```sh
sudo apt-get install gcc build-essential wget
wget https://github.com/TA-Lib/ta-lib/releases/download/v0.6.4/ta-lib-0.6.4-src.tar.gz
tar xzf ta-lib-0.6.4-src.tar.gz
cd ta-lib-0.6.4
./configure --prefix=/usr
make
sudo make install
```

## Development

### Architecture

All C and Elixir source files for the NIF bindings are code-generated from TA-Lib's introspection API. The source of truth is the installed TA-Lib library itself.

**Hand-written files:**
- `c_src/util.c`, `c_src/util.h` — shared NIF helpers
- `lib/executer.ex` — parameter loading and function dispatch
- `lib/mix/tasks/talib.ex` — mix task that generates C and Elixir code from `FunctionDef`

**Generated files (gitignored):**
- `c_src/func_*.c`, `c_src/funcs.h`, `c_src/talib.c` — NIF C code
- `lib/nif.ex` — NIF function stubs
- `lib/talib_ex.ex` — public Elixir API module
- `lib/mix/tasks/function_def.ex` — function metadata extracted from TA-Lib

### Code generation

The `tools/` directory contains a standalone pipeline that introspects TA-Lib and regenerates all code:

```sh
# Full pipeline: introspect ta-lib -> JSON -> FunctionDef -> C/Elixir code
make -C tools generate
```

This runs three steps:

1. **`tools/talib_introspect.c`** — a C program that uses TA-Lib's abstract API (`TA_ForEachFunc`, `TA_GetFuncInfo`, etc.) to dump all function metadata as JSON
2. **`tools/generate_function_def.exs`** — an Elixir script that reads the JSON and generates `lib/mix/tasks/function_def.ex`
3. **`mix talib`** — reads `FunctionDef.mapping()` and generates the C source files, NIF module, and public API module

### When TA-Lib updates

```sh
brew upgrade ta-lib          # or install new version
make -C tools generate       # regenerate everything
mix compile                  # build the NIF
```

### Precompiled binaries

Precompiled NIFs are built via GitHub Actions on tag pushes (`v*`). The CI workflow:

1. Builds TA-Lib from source with `--enable-static --disable-shared` for each target
2. Statically links TA-Lib into the NIF (users need zero native dependencies)
3. Uploads tarballs to a GitHub Release
4. Generates a checksum file for hex.pm publishing

Supported targets: macOS arm64, macOS x86_64, Linux x86_64, Linux aarch64.

## License

MIT
