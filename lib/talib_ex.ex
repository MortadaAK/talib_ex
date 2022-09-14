defmodule TalibEx do
  @moduledoc """
  Interface for talib
  """
  # Generated File
  alias TalibEx.{Nif, Executer}

  @dialyzer {:nowarn_function, acos: 1}
  @spec acos([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric ACos

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ACOS`
  """
  def acos(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_acos/1)
  end

  @dialyzer {:nowarn_function, ad: 1}
  @spec ad([
          {:high, [number()]} | {:low, [number()]} | {:close, [number()]} | {:volume, [number()]}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Chaikin A/D Line

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `volume`: Volume List

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_AD`
  """
  def ad(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:volume, :double_array)
    |> Executer.call(&Nif.nif_ad/4)
  end

  @dialyzer {:nowarn_function, add: 1}
  @spec add([{:values0, [number()]} | {:values1, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Arithmetic Add

  ---
  Inputs
  - `values0`
  - `values1`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ADD`
  """
  def add(params) do
    params
    |> Executer.new()
    |> Executer.load(:values0, :double_array)
    |> Executer.load(:values1, :double_array)
    |> Executer.call(&Nif.nif_add/2)
  end

  @dialyzer {:nowarn_function, adosc: 1}
  @spec adosc([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:volume, [number()]}
          | {:fast_period, pos_integer()}
          | {:slow_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Chaikin A/D Oscillator

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `volume`: Volume List
  - `fast_period` (default `5`): Number of period for the fast MA (between `2` and `100000`)
  - `slow_period` (default `15`): Number of period for the slow MA (between `2` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ADOSC`
  """
  def adosc(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:volume, :double_array)
    |> Executer.load(:fast_period, :integer, %{default: 5, min: 2, max: 100_000})
    |> Executer.load(:slow_period, :integer, %{default: 15, min: 2, max: 100_000})
    |> Executer.call(&Nif.nif_adosc/6)
  end

  @dialyzer {:nowarn_function, adx: 1}
  @spec adx([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Average Directional Movement Index

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ADX`
  """
  def adx(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_adx/4)
  end

  @dialyzer {:nowarn_function, adxr: 1}
  @spec adxr([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Average Directional Movement Index Rating

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ADXR`
  """
  def adxr(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_adxr/4)
  end

  @dialyzer {:nowarn_function, apo: 1}
  @spec apo([
          {:values, [number()]}
          | {:fast_period, pos_integer()}
          | {:slow_period, pos_integer()}
          | {:moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Absolute Price Oscillator

  ---
  Inputs
  - `values`
  - `fast_period` (default `5`): Number of period for the fast MA (between `2` and `100000`)
  - `slow_period` (default `15`): Number of period for the slow MA (between `2` and `100000`)
  - `moving_average_type` (default `:sma`): Type of moving average. `sma` | `ema` | `wma` | `dema` | `tema` | `trima` | `kama` | `mama` | `t3`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_APO`
  """
  def apo(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:fast_period, :integer, %{default: 5, min: 2, max: 100_000})
    |> Executer.load(:slow_period, :integer, %{default: 15, min: 2, max: 100_000})
    |> Executer.load(:moving_average_type, :ma_type, %{default: :sma})
    |> Executer.call(&Nif.nif_apo/4)
  end

  @dialyzer {:nowarn_function, aroon: 1}
  @spec aroon([{:high, [number()]} | {:low, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, down :: [number() | :nan], up :: [number() | :nan]} | {:error, term()}
  @doc """
  Aroon

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `down`: Arron Down
  - `up`: Arron Up

  ---
  TA-LIB src `TA_AROON`
  """
  def aroon(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_aroon/3)
  end

  @dialyzer {:nowarn_function, aroonosc: 1}
  @spec aroonosc([{:high, [number()]} | {:low, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Aroon Oscillator

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_AROONOSC`
  """
  def aroonosc(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_aroonosc/3)
  end

  @dialyzer {:nowarn_function, asin: 1}
  @spec asin([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric ASin

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ASIN`
  """
  def asin(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_asin/1)
  end

  @dialyzer {:nowarn_function, atan: 1}
  @spec atan([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric ATan

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ATAN`
  """
  def atan(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_atan/1)
  end

  @dialyzer {:nowarn_function, atr: 1}
  @spec atr([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Average True Range

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ATR`
  """
  def atr(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_atr/4)
  end

  @dialyzer {:nowarn_function, avgprice: 1}
  @spec avgprice([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Average Price

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_AVGPRICE`
  """
  def avgprice(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_avgprice/4)
  end

  @dialyzer {:nowarn_function, bbands: 1}
  @spec bbands([
          {:values, [number()]}
          | {:time_period, pos_integer()}
          | {:np_dev_up, number()}
          | {:np_dev_down, number()}
          | {:moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) ::
          {:ok, upper :: [number() | :nan], middle :: [number() | :nan],
           lower :: [number() | :nan]}
          | {:error, term()}
  @doc """
  Bollinger Bands

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)
  - `np_dev_up`: Deviation multiplier for upper band
  - `np_dev_down`: Deviation multiplier for lower band
  - `moving_average_type` (default `:sma`): Type of moving average. `sma` | `ema` | `wma` | `dema` | `tema` | `trima` | `kama` | `mama` | `t3`

  ---
  Outputs
  - `upper`: Upper Band
  - `middle`: Middle Band
  - `lower`: Lower Band

  ---
  TA-LIB src `TA_BBANDS`
  """
  def bbands(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.load(:np_dev_up, :double)
    |> Executer.load(:np_dev_down, :double)
    |> Executer.load(:moving_average_type, :ma_type, %{default: :sma})
    |> Executer.call(&Nif.nif_bbands/5)
  end

  @dialyzer {:nowarn_function, beta: 1}
  @spec beta([{:values0, [number()]} | {:values1, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Beta

  ---
  Inputs
  - `values0`
  - `values1`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_BETA`
  """
  def beta(params) do
    params
    |> Executer.new()
    |> Executer.load(:values0, :double_array)
    |> Executer.load(:values1, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_beta/3)
  end

  @dialyzer {:nowarn_function, bop: 1}
  @spec bop([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Balance Of Power

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_BOP`
  """
  def bop(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_bop/4)
  end

  @dialyzer {:nowarn_function, cci: 1}
  @spec cci([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Commodity Channel Index

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_CCI`
  """
  def cci(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_cci/4)
  end

  @dialyzer {:nowarn_function, cdl2_crows: 1}
  @spec cdl2_crows([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Two Crows

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDL2CROWS`
  """
  def cdl2_crows(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl2_crows/4)
  end

  @dialyzer {:nowarn_function, cdl3_black_crows: 1}
  @spec cdl3_black_crows([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Three Black Crows

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDL3BLACKCROWS`
  """
  def cdl3_black_crows(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl3_black_crows/4)
  end

  @dialyzer {:nowarn_function, cdl3_inside: 1}
  @spec cdl3_inside([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Three Inside Up/Down

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDL3INSIDE`
  """
  def cdl3_inside(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl3_inside/4)
  end

  @dialyzer {:nowarn_function, cdl3_line_strike: 1}
  @spec cdl3_line_strike([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Three-Line Strike

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDL3LINESTRIKE`
  """
  def cdl3_line_strike(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl3_line_strike/4)
  end

  @dialyzer {:nowarn_function, cdl3_outside: 1}
  @spec cdl3_outside([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Three Outside Up/Down

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDL3OUTSIDE`
  """
  def cdl3_outside(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl3_outside/4)
  end

  @dialyzer {:nowarn_function, cdl3_stars_in_south: 1}
  @spec cdl3_stars_in_south([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Three Stars In The South

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDL3STARSINSOUTH`
  """
  def cdl3_stars_in_south(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl3_stars_in_south/4)
  end

  @dialyzer {:nowarn_function, cdl3_white_soldiers: 1}
  @spec cdl3_white_soldiers([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Three Advancing White Soldiers

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDL3WHITESOLDIERS`
  """
  def cdl3_white_soldiers(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl3_white_soldiers/4)
  end

  @dialyzer {:nowarn_function, cdl_abandoned_baby: 1}
  @spec cdl_abandoned_baby([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:pentration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Abandoned Baby

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `pentration`: Percentage of penetration of a candle within another candle (minuimum `0`)

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLABANDONEDBABY`
  """
  def cdl_abandoned_baby(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:pentration, :double, %{min: 0})
    |> Executer.call(&Nif.nif_cdl_abandoned_baby/5)
  end

  @dialyzer {:nowarn_function, cdl_advance_block: 1}
  @spec cdl_advance_block([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Advance Block

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLADVANCEBLOCK`
  """
  def cdl_advance_block(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_advance_block/4)
  end

  @dialyzer {:nowarn_function, cdl_belt_hold: 1}
  @spec cdl_belt_hold([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Belt-hold

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLBELTHOLD`
  """
  def cdl_belt_hold(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_belt_hold/4)
  end

  @dialyzer {:nowarn_function, cdl_breakaway: 1}
  @spec cdl_breakaway([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Breakaway

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLBREAKAWAY`
  """
  def cdl_breakaway(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_breakaway/4)
  end

  @dialyzer {:nowarn_function, cdl_closing_marubozu: 1}
  @spec cdl_closing_marubozu([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Closing Marubozu

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLCLOSINGMARUBOZU`
  """
  def cdl_closing_marubozu(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_closing_marubozu/4)
  end

  @dialyzer {:nowarn_function, cdl_conceal_baby_swallow: 1}
  @spec cdl_conceal_baby_swallow([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Concealing Baby Swallow

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLCONCEALBABYSWALL`
  """
  def cdl_conceal_baby_swallow(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_conceal_baby_swallow/4)
  end

  @dialyzer {:nowarn_function, cdl_counterattack: 1}
  @spec cdl_counterattack([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Counterattack

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLCOUNTERATTACK`
  """
  def cdl_counterattack(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_counterattack/4)
  end

  @dialyzer {:nowarn_function, cdl_dark_cloud_cover: 1}
  @spec cdl_dark_cloud_cover([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:peneration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Dark Cloud Cover

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `peneration`

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLDARKCLOUDCOVER`
  """
  def cdl_dark_cloud_cover(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:peneration, :double)
    |> Executer.call(&Nif.nif_cdl_dark_cloud_cover/5)
  end

  @dialyzer {:nowarn_function, cdl_doji: 1}
  @spec cdl_doji([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Doji

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLDOJI`
  """
  def cdl_doji(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_doji/4)
  end

  @dialyzer {:nowarn_function, cdl_doji_star: 1}
  @spec cdl_doji_star([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Doji Star

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLDOJISTAR`
  """
  def cdl_doji_star(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_doji_star/4)
  end

  @dialyzer {:nowarn_function, cdl_dragonfly_doji: 1}
  @spec cdl_dragonfly_doji([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Dragonfly Doji

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLDRAGONFLYDOJI`
  """
  def cdl_dragonfly_doji(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_dragonfly_doji/4)
  end

  @dialyzer {:nowarn_function, cdl_engulfing: 1}
  @spec cdl_engulfing([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Engulfing Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLENGULFING`
  """
  def cdl_engulfing(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_engulfing/4)
  end

  @dialyzer {:nowarn_function, cdl_evening_doji_star: 1}
  @spec cdl_evening_doji_star([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:peneration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Evening Doji Star

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `peneration`

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLEVENINGDOJISTAR`
  """
  def cdl_evening_doji_star(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:peneration, :double)
    |> Executer.call(&Nif.nif_cdl_evening_doji_star/5)
  end

  @dialyzer {:nowarn_function, cdl_evening_star: 1}
  @spec cdl_evening_star([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:peneration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Evening Star

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `peneration`

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLEVENINGSTAR`
  """
  def cdl_evening_star(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:peneration, :double)
    |> Executer.call(&Nif.nif_cdl_evening_star/5)
  end

  @dialyzer {:nowarn_function, cdl_gap_side_side_white: 1}
  @spec cdl_gap_side_side_white([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Up/Down-gap side-by-side white lines

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLGAPSIDESIDEWHITE`
  """
  def cdl_gap_side_side_white(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_gap_side_side_white/4)
  end

  @dialyzer {:nowarn_function, cdl_gravestone_doji: 1}
  @spec cdl_gravestone_doji([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Gravestone Doji

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLGRAVESTONEDOJI`
  """
  def cdl_gravestone_doji(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_gravestone_doji/4)
  end

  @dialyzer {:nowarn_function, cdl_hammer: 1}
  @spec cdl_hammer([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Hammer

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLHAMMER`
  """
  def cdl_hammer(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_hammer/4)
  end

  @dialyzer {:nowarn_function, cdl_hanging_man: 1}
  @spec cdl_hanging_man([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Hanging Man

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLHANGINGMAN`
  """
  def cdl_hanging_man(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_hanging_man/4)
  end

  @dialyzer {:nowarn_function, cdl_harami: 1}
  @spec cdl_harami([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Harami Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLHARAMI`
  """
  def cdl_harami(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_harami/4)
  end

  @dialyzer {:nowarn_function, cdl_harami_cross: 1}
  @spec cdl_harami_cross([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Harami Cross Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLHARAMICROSS`
  """
  def cdl_harami_cross(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_harami_cross/4)
  end

  @dialyzer {:nowarn_function, cdl_highwave: 1}
  @spec cdl_highwave([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  High-Wave Candle

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLHIGHWAVE`
  """
  def cdl_highwave(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_highwave/4)
  end

  @dialyzer {:nowarn_function, cdl_hikkake: 1}
  @spec cdl_hikkake([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Hikkake Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLHIKKAKE`
  """
  def cdl_hikkake(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_hikkake/4)
  end

  @dialyzer {:nowarn_function, cdl_hikkake_mod: 1}
  @spec cdl_hikkake_mod([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Modified Hikkake Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLHIKKAKEMOD`
  """
  def cdl_hikkake_mod(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_hikkake_mod/4)
  end

  @dialyzer {:nowarn_function, cdl_homing_pigeon: 1}
  @spec cdl_homing_pigeon([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Homing Pigeon

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLHOMINGPIGEON`
  """
  def cdl_homing_pigeon(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_homing_pigeon/4)
  end

  @dialyzer {:nowarn_function, cdl_identical_3_crows: 1}
  @spec cdl_identical_3_crows([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Identical Three Crows

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLIDENTICAL3CROWS`
  """
  def cdl_identical_3_crows(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_identical_3_crows/4)
  end

  @dialyzer {:nowarn_function, cdl_inneck: 1}
  @spec cdl_inneck([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  In-Neck Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLINNECK`
  """
  def cdl_inneck(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_inneck/4)
  end

  @dialyzer {:nowarn_function, cdl_inverted_hammer: 1}
  @spec cdl_inverted_hammer([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Inverted Hammer

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLINVERTEDHAMMER`
  """
  def cdl_inverted_hammer(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_inverted_hammer/4)
  end

  @dialyzer {:nowarn_function, cdl_kicking: 1}
  @spec cdl_kicking([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Kicking

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLKICKING`
  """
  def cdl_kicking(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_kicking/4)
  end

  @dialyzer {:nowarn_function, cdl_kicking_by_length: 1}
  @spec cdl_kicking_by_length([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Kicking - bull/bear determined by the longer marubozu

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLKICKINGBYLENGTH`
  """
  def cdl_kicking_by_length(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_kicking_by_length/4)
  end

  @dialyzer {:nowarn_function, cdl_ladder_bottom: 1}
  @spec cdl_ladder_bottom([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Ladder Bottom

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLLADDERBOTTOM`
  """
  def cdl_ladder_bottom(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_ladder_bottom/4)
  end

  @dialyzer {:nowarn_function, cdl_long_legged_doji: 1}
  @spec cdl_long_legged_doji([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Long Legged Doji

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLLONGLEGGEDDOJI`
  """
  def cdl_long_legged_doji(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_long_legged_doji/4)
  end

  @dialyzer {:nowarn_function, cdl_long_line: 1}
  @spec cdl_long_line([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Long Line Candle

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLLONGLINE`
  """
  def cdl_long_line(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_long_line/4)
  end

  @dialyzer {:nowarn_function, cdl_marubozu: 1}
  @spec cdl_marubozu([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Marubozu

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLMARUBOZU`
  """
  def cdl_marubozu(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_marubozu/4)
  end

  @dialyzer {:nowarn_function, cdl_matching_low: 1}
  @spec cdl_matching_low([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Matching Low

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLMATCHINGLOW`
  """
  def cdl_matching_low(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_matching_low/4)
  end

  @dialyzer {:nowarn_function, cdl_mat_hold: 1}
  @spec cdl_mat_hold([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:pentration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Mat Hold

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `pentration`: Percentage of penetration of a candle within another candle (minuimum `0`)

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLMATHOLD`
  """
  def cdl_mat_hold(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:pentration, :double, %{min: 0})
    |> Executer.call(&Nif.nif_cdl_mat_hold/5)
  end

  @dialyzer {:nowarn_function, cdl_morning_doji_star: 1}
  @spec cdl_morning_doji_star([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:pentration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Morning Doji Star

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `pentration`: Percentage of penetration of a candle within another candle (minuimum `0`)

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLMORNINGDOJISTAR`
  """
  def cdl_morning_doji_star(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:pentration, :double, %{min: 0})
    |> Executer.call(&Nif.nif_cdl_morning_doji_star/5)
  end

  @dialyzer {:nowarn_function, cdl_morning_star: 1}
  @spec cdl_morning_star([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:pentration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Morning Star

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `pentration`: Percentage of penetration of a candle within another candle (minuimum `0`)

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLMORNINGSTAR`
  """
  def cdl_morning_star(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:pentration, :double, %{min: 0})
    |> Executer.call(&Nif.nif_cdl_morning_star/5)
  end

  @dialyzer {:nowarn_function, cdl_on_neck: 1}
  @spec cdl_on_neck([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  On-Neck Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLONNECK`
  """
  def cdl_on_neck(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_on_neck/4)
  end

  @dialyzer {:nowarn_function, cdl_piercing: 1}
  @spec cdl_piercing([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Piercing Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLPIERCING`
  """
  def cdl_piercing(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_piercing/4)
  end

  @dialyzer {:nowarn_function, cdl_rickshaw_man: 1}
  @spec cdl_rickshaw_man([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Rickshaw Man

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLRICKSHAWMAN`
  """
  def cdl_rickshaw_man(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_rickshaw_man/4)
  end

  @dialyzer {:nowarn_function, cdl_rise_fall_3_methods: 1}
  @spec cdl_rise_fall_3_methods([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Rickshaw Man

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLRISEFALL3METHODS`
  """
  def cdl_rise_fall_3_methods(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_rise_fall_3_methods/4)
  end

  @dialyzer {:nowarn_function, cdl_separating_lines: 1}
  @spec cdl_separating_lines([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Separating Lines

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLSEPARATINGLINES`
  """
  def cdl_separating_lines(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_separating_lines/4)
  end

  @dialyzer {:nowarn_function, cdl_shooting_star: 1}
  @spec cdl_shooting_star([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Shooting Star

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLSHOOTINGSTAR`
  """
  def cdl_shooting_star(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_shooting_star/4)
  end

  @dialyzer {:nowarn_function, cdl_short_line: 1}
  @spec cdl_short_line([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Short Line Candle

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLSHORTLINE`
  """
  def cdl_short_line(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_short_line/4)
  end

  @dialyzer {:nowarn_function, cdl_spinning_top: 1}
  @spec cdl_spinning_top([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Spinning Top

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLSPINNINGTOP`
  """
  def cdl_spinning_top(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_spinning_top/4)
  end

  @dialyzer {:nowarn_function, cdl_stalled_pattern: 1}
  @spec cdl_stalled_pattern([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Stalled Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLSTALLEDPATTERN`
  """
  def cdl_stalled_pattern(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_stalled_pattern/4)
  end

  @dialyzer {:nowarn_function, cdl_stick_sandwich: 1}
  @spec cdl_stick_sandwich([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Stick Sandwich

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLSTICKSANDWICH`
  """
  def cdl_stick_sandwich(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_stick_sandwich/4)
  end

  @dialyzer {:nowarn_function, cdl_takuri: 1}
  @spec cdl_takuri([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Takuri (Dragonfly Doji with very long lower shadow)

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLTAKURI`
  """
  def cdl_takuri(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_takuri/4)
  end

  @dialyzer {:nowarn_function, cdl_tasuki_gap: 1}
  @spec cdl_tasuki_gap([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Tasuki Gap

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLTASUKIGAP`
  """
  def cdl_tasuki_gap(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_tasuki_gap/4)
  end

  @dialyzer {:nowarn_function, cdl_thrusting: 1}
  @spec cdl_thrusting([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Thrusting Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLTHRUSTING`
  """
  def cdl_thrusting(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_thrusting/4)
  end

  @dialyzer {:nowarn_function, cdl_tri_star: 1}
  @spec cdl_tri_star([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Tristar Pattern

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLTRISTAR`
  """
  def cdl_tri_star(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_tri_star/4)
  end

  @dialyzer {:nowarn_function, cdl_unique_3_river: 1}
  @spec cdl_unique_3_river([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Unique 3 River

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLUNIQUE3RIVER`
  """
  def cdl_unique_3_river(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_unique_3_river/4)
  end

  @dialyzer {:nowarn_function, cdl_upside_gap_2_crows: 1}
  @spec cdl_upside_gap_2_crows([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Upside Gap Two Crows

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLUPSIDEGAP2CROWS`
  """
  def cdl_upside_gap_2_crows(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_upside_gap_2_crows/4)
  end

  @dialyzer {:nowarn_function, cdl_upside_downside_gap_3_methods: 1}
  @spec cdl_upside_downside_gap_3_methods([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Upside/Downside Gap Three Methods

  ---
  Inputs
  - `open`: Open Price List
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_CDLXSIDEGAP3METHODS`
  """
  def cdl_upside_downside_gap_3_methods(params) do
    params
    |> Executer.new()
    |> Executer.load(:open, :double_array)
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_cdl_upside_downside_gap_3_methods/4)
  end

  @dialyzer {:nowarn_function, ceil: 1}
  @spec ceil([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Ceil

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_CEIL`
  """
  def ceil(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_ceil/1)
  end

  @dialyzer {:nowarn_function, cmo: 1}
  @spec cmo([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Chande Momentum Oscillator

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_CMO`
  """
  def cmo(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_cmo/2)
  end

  @dialyzer {:nowarn_function, correl: 1}
  @spec correl([{:values0, [number()]} | {:values1, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Pearson's Correlation Coefficient (r)

  ---
  Inputs
  - `values0`
  - `values1`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_CORREL`
  """
  def correl(params) do
    params
    |> Executer.new()
    |> Executer.load(:values0, :double_array)
    |> Executer.load(:values1, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_correl/3)
  end

  @dialyzer {:nowarn_function, cos: 1}
  @spec cos([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric Cos

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_COS`
  """
  def cos(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_cos/1)
  end

  @dialyzer {:nowarn_function, cosh: 1}
  @spec cosh([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric Cosh

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_COSH`
  """
  def cosh(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_cosh/1)
  end

  @dialyzer {:nowarn_function, dema: 1}
  @spec dema([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Double Exponential Moving Average

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_DEMA`
  """
  def dema(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_dema/2)
  end

  @dialyzer {:nowarn_function, div: 1}
  @spec div([{:values0, [number()]} | {:values1, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Arithmetic Div

  ---
  Inputs
  - `values0`
  - `values1`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_DIV`
  """
  def div(params) do
    params
    |> Executer.new()
    |> Executer.load(:values0, :double_array)
    |> Executer.load(:values1, :double_array)
    |> Executer.call(&Nif.nif_div/2)
  end

  @dialyzer {:nowarn_function, dx: 1}
  @spec dx([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Directional Movement Index

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_DX`
  """
  def dx(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_dx/4)
  end

  @dialyzer {:nowarn_function, ema: 1}
  @spec ema([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Exponential Moving Average

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_EMA`
  """
  def ema(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_ema/2)
  end

  @dialyzer {:nowarn_function, exp: 1}
  @spec exp([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Arithmetic Exp

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_EXP`
  """
  def exp(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_exp/1)
  end

  @dialyzer {:nowarn_function, floor: 1}
  @spec floor([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Floor

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_FLOOR`
  """
  def floor(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_floor/1)
  end

  @dialyzer {:nowarn_function, ht_dcperiod: 1}
  @spec ht_dcperiod([{:values, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Hilbert Transform - Dominant Cycle Period

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_HT_DCPERIOD`
  """
  def ht_dcperiod(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_ht_dcperiod/1)
  end

  @dialyzer {:nowarn_function, ht_dcphase: 1}
  @spec ht_dcphase([{:values, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Hilbert Transform - Dominant Cycle Phase

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_HT_DCPHASE`
  """
  def ht_dcphase(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_ht_dcphase/1)
  end

  @dialyzer {:nowarn_function, ht_phasor: 1}
  @spec ht_phasor([{:values, [number()]}]) ::
          {:ok, in_phase :: [number() | :nan], quadrature :: [number() | :nan]} | {:error, term()}
  @doc """
  Hilbert Transform - Phasor Components

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `in_phase`
  - `quadrature`

  ---
  TA-LIB src `TA_HT_PHASOR`
  """
  def ht_phasor(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_ht_phasor/1)
  end

  @dialyzer {:nowarn_function, ht_sine: 1}
  @spec ht_sine([{:values, [number()]}]) ::
          {:ok, sine :: [number() | :nan], leadSine :: [number() | :nan]} | {:error, term()}
  @doc """
  Hilbert Transform - SineWave

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `sine`
  - `leadSine`

  ---
  TA-LIB src `TA_HT_SINE`
  """
  def ht_sine(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_ht_sine/1)
  end

  @dialyzer {:nowarn_function, ht_trendline: 1}
  @spec ht_trendline([{:values, [number()]}]) ::
          {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc """
  Hilbert Transform - Instantaneous Trendline

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_HT_TRENDLINE`
  """
  def ht_trendline(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_ht_trendline/1)
  end

  @dialyzer {:nowarn_function, ht_trendmode: 1}
  @spec ht_trendmode([{:values, [number()]}]) ::
          {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Hilbert Transform - Trend vs Cycle Mode

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_HT_TRENDMODE`
  """
  def ht_trendmode(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_ht_trendmode/1)
  end

  @dialyzer {:nowarn_function, kama: 1}
  @spec kama([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Kaufman Adaptive Moving Average

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_KAMA`
  """
  def kama(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_kama/2)
  end

  @dialyzer {:nowarn_function, linear_reg: 1}
  @spec linear_reg([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Linear Regression

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_LINEARREG`
  """
  def linear_reg(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_linear_reg/2)
  end

  @dialyzer {:nowarn_function, linear_reg_angle: 1}
  @spec linear_reg_angle([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Linear Regression Angle

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_LINEARREG_ANGLE`
  """
  def linear_reg_angle(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_linear_reg_angle/2)
  end

  @dialyzer {:nowarn_function, linear_reg_intercept: 1}
  @spec linear_reg_intercept([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Linear Regression Intercept

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_LINEARREG_INTERCEPT`
  """
  def linear_reg_intercept(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_linear_reg_intercept/2)
  end

  @dialyzer {:nowarn_function, linear_reg_slope: 1}
  @spec linear_reg_slope([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Linear Regression Slope

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_LINEARREG_SLOPE`
  """
  def linear_reg_slope(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_linear_reg_slope/2)
  end

  @dialyzer {:nowarn_function, ln: 1}
  @spec ln([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Log Natural

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_LN`
  """
  def ln(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_ln/1)
  end

  @dialyzer {:nowarn_function, log10: 1}
  @spec log10([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Log10

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_LOG10`
  """
  def log10(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_log10/1)
  end

  @dialyzer {:nowarn_function, ma: 1}
  @spec ma([
          {:values, [number()]}
          | {:time_period, pos_integer()}
          | {:moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Moving average

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)
  - `moving_average_type` (default `:sma`): Type of moving average. `sma` | `ema` | `wma` | `dema` | `tema` | `trima` | `kama` | `mama` | `t3`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_MA`
  """
  def ma(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.load(:moving_average_type, :ma_type, %{default: :sma})
    |> Executer.call(&Nif.nif_ma/3)
  end

  @dialyzer {:nowarn_function, macd: 1}
  @spec macd([
          {:values, [number()]}
          | {:fast_period, pos_integer()}
          | {:slow_period, pos_integer()}
          | {:signal_period, pos_integer()}
        ]) ::
          {:ok, macd :: [number() | :nan], macd_signal :: [number() | :nan],
           macd_hist :: [number() | :nan]}
          | {:error, term()}
  @doc """
  Moving Average Convergence/Divergence

  ---
  Inputs
  - `values`
  - `fast_period` (default `5`): Number of period for the fast MA (between `2` and `100000`)
  - `slow_period` (default `15`): Number of period for the slow MA (between `2` and `100000`)
  - `signal_period` (default `1`): Smoothing for the signal line (between `1` and `100000`)

  ---
  Outputs
  - `macd`
  - `macd_signal`
  - `macd_hist`

  ---
  TA-LIB src `TA_MACD`
  """
  def macd(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:fast_period, :integer, %{default: 5, min: 2, max: 100_000})
    |> Executer.load(:slow_period, :integer, %{default: 15, min: 2, max: 100_000})
    |> Executer.load(:signal_period, :integer, %{default: 1, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_macd/4)
  end

  @dialyzer {:nowarn_function, macdext: 1}
  @spec macdext([
          {:values, [number()]}
          | {:fast_period, pos_integer()}
          | {:fast_moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
          | {:slow_period, pos_integer()}
          | {:slow_moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
          | {:signal_period, pos_integer()}
          | {:single_moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) ::
          {:ok, macd :: [number() | :nan], macd_signal :: [number() | :nan],
           macd_hist :: [number() | :nan]}
          | {:error, term()}
  @doc """
  MACD with controllable MA type

  ---
  Inputs
  - `values`
  - `fast_period` (default `5`): Number of period for the fast MA (between `2` and `100000`)
  - `fast_moving_average_type` (default `:sma`): Type of moving average. `sma` | `ema` | `wma` | `dema` | `tema` | `trima` | `kama` | `mama` | `t3`
  - `slow_period` (default `15`): Number of period for the slow MA (between `2` and `100000`)
  - `slow_moving_average_type` (default `:sma`): Type of moving average. `sma` | `ema` | `wma` | `dema` | `tema` | `trima` | `kama` | `mama` | `t3`
  - `signal_period` (default `1`): Smoothing for the signal line (between `1` and `100000`)
  - `single_moving_average_type` (default `:sma`): Type of moving average. `sma` | `ema` | `wma` | `dema` | `tema` | `trima` | `kama` | `mama` | `t3`

  ---
  Outputs
  - `macd`
  - `macd_signal`
  - `macd_hist`

  ---
  TA-LIB src `TA_MACDEXT`
  """
  def macdext(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:fast_period, :integer, %{default: 5, min: 2, max: 100_000})
    |> Executer.load(:fast_moving_average_type, :ma_type, %{default: :sma})
    |> Executer.load(:slow_period, :integer, %{default: 15, min: 2, max: 100_000})
    |> Executer.load(:slow_moving_average_type, :ma_type, %{default: :sma})
    |> Executer.load(:signal_period, :integer, %{default: 1, min: 1, max: 100_000})
    |> Executer.load(:single_moving_average_type, :ma_type, %{default: :sma})
    |> Executer.call(&Nif.nif_macdext/7)
  end

  @dialyzer {:nowarn_function, macdfix: 1}
  @spec macdfix([{:values, [number()]} | {:signal_period, pos_integer()}]) ::
          {:ok, macd :: [number() | :nan], macd_signal :: [number() | :nan],
           macd_hist :: [number() | :nan]}
          | {:error, term()}
  @doc """
  Moving Average Convergence/Divergence Fix 12/26

  ---
  Inputs
  - `values`
  - `signal_period` (default `1`): Smoothing for the signal line (between `1` and `100000`)

  ---
  Outputs
  - `macd`
  - `macd_signal`
  - `macd_hist`

  ---
  TA-LIB src `TA_MACDFIX`
  """
  def macdfix(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:signal_period, :integer, %{default: 1, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_macdfix/2)
  end

  @dialyzer {:nowarn_function, mama: 1}
  @spec mama([{:values, [number()]} | {:fast_limit, number()} | {:slow_limit, number()}]) ::
          {:ok, mama :: [number() | :nan], fama :: [number() | :nan]} | {:error, term()}
  @doc """
  MESA Adaptive Moving Average

  ---
  Inputs
  - `values`
  - `fast_limit` (default `0.75`): Upper limit use in the adaptive algorithm (between `0.01` and `0.99`)
  - `slow_limit` (default `0.25`): Lower limit use in the adaptive algorithm (between `0.01` and `0.99`)

  ---
  Outputs
  - `mama`
  - `fama`

  ---
  TA-LIB src `TA_MAMA`
  """
  def mama(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:fast_limit, :double, %{default: 0.75, min: 0.01, max: 0.99})
    |> Executer.load(:slow_limit, :double, %{default: 0.25, min: 0.01, max: 0.99})
    |> Executer.call(&Nif.nif_mama/3)
  end

  @dialyzer {:nowarn_function, mavp: 1}
  @spec mavp([
          {:values, [number()]}
          | {:periods, [number()]}
          | {:min_period, pos_integer()}
          | {:max_period, pos_integer()}
          | {:moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc """
  Moving average with variable period

  ---
  Inputs
  - `values`
  - `periods`
  - `min_period` (default `5`): Value less than minimum will be changed to Minimum period (between `2` and `100000`)
  - `max_period` (default `15`): Value higher than maximum will be changed to Maximum period (between `2` and `100000`)
  - `moving_average_type` (default `:sma`): Type of moving average. `sma` | `ema` | `wma` | `dema` | `tema` | `trima` | `kama` | `mama` | `t3`

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_MAVP`
  """
  def mavp(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:periods, :double_array)
    |> Executer.load(:min_period, :integer, %{default: 5, min: 2, max: 100_000})
    |> Executer.load(:max_period, :integer, %{default: 15, min: 2, max: 100_000})
    |> Executer.load(:moving_average_type, :ma_type, %{default: :sma})
    |> Executer.call(&Nif.nif_mavp/5)
  end

  @dialyzer {:nowarn_function, max: 1}
  @spec max([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Highest value over a specified period

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_MAX`
  """
  def max(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_max/2)
  end

  @dialyzer {:nowarn_function, max_index: 1}
  @spec max_index([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Index of highest value over a specified period

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_MAXINDEX`
  """
  def max_index(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_max_index/2)
  end

  @dialyzer {:nowarn_function, med_price: 1}
  @spec med_price([{:high, [number()]} | {:low, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Median Price

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_MEDPRICE`
  """
  def med_price(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.call(&Nif.nif_med_price/2)
  end

  @dialyzer {:nowarn_function, mfi: 1}
  @spec mfi([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:volume, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Money Flow Index

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `volume`: Volume List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_MFI`
  """
  def mfi(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:volume, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_mfi/5)
  end

  @dialyzer {:nowarn_function, mid_point: 1}
  @spec mid_point([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  MidPoint over period

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_MIDPOINT`
  """
  def mid_point(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_mid_point/2)
  end

  @dialyzer {:nowarn_function, mid_price: 1}
  @spec mid_price([{:high, [number()]} | {:low, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Midpoint Price over period

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_MIDPRICE`
  """
  def mid_price(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_mid_price/3)
  end

  @dialyzer {:nowarn_function, min: 1}
  @spec min([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Lowest value over a specified period

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_MIN`
  """
  def min(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_min/2)
  end

  @dialyzer {:nowarn_function, min_index: 1}
  @spec min_index([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Index of lowest value over a specified period

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_MININDEX`
  """
  def min_index(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_min_index/2)
  end

  @dialyzer {:nowarn_function, min_max: 1}
  @spec min_max([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, min :: [number() | :nan], max :: [number() | :nan]} | {:error, term()}
  @doc """
  Lowest and highest values over a specified period

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `min`
  - `max`

  ---
  TA-LIB src `TA_MINMAX`
  """
  def min_max(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_min_max/2)
  end

  @dialyzer {:nowarn_function, min_max_index: 1}
  @spec min_max_index([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, min :: [integer() | :nan], max :: [integer() | :nan]} | {:error, term()}
  @doc """
  Indexes of lowest and highest values over a specified period

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `min`
  - `max`

  ---
  TA-LIB src `TA_MINMAXINDEX`
  """
  def min_max_index(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_min_max_index/2)
  end

  @dialyzer {:nowarn_function, minus_di: 1}
  @spec minus_di([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Minus Directional Indicator

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_MINUS_DI`
  """
  def minus_di(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_minus_di/4)
  end

  @dialyzer {:nowarn_function, minus_dm: 1}
  @spec minus_dm([{:high, [number()]} | {:low, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Minus Directional Movement

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_MINUS_DM`
  """
  def minus_dm(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_minus_dm/3)
  end

  @dialyzer {:nowarn_function, mom: 1}
  @spec mom([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc """
  Momentum

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `list`

  ---
  TA-LIB src `TA_MOM`
  """
  def mom(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_mom/2)
  end

  @dialyzer {:nowarn_function, mult: 1}
  @spec mult([{:values0, [number()]} | {:values1, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Arithmetic Mult

  ---
  Inputs
  - `values0`
  - `values1`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_MULT`
  """
  def mult(params) do
    params
    |> Executer.new()
    |> Executer.load(:values0, :double_array)
    |> Executer.load(:values1, :double_array)
    |> Executer.call(&Nif.nif_mult/2)
  end

  @dialyzer {:nowarn_function, natr: 1}
  @spec natr([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Normalized Average True Range

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_NATR`
  """
  def natr(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_natr/4)
  end

  @dialyzer {:nowarn_function, obv: 1}
  @spec obv([{:values, [number()]} | {:volume, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  On Balance Volume

  ---
  Inputs
  - `values`
  - `volume`: Volume List

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_OBV`
  """
  def obv(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:volume, :double_array)
    |> Executer.call(&Nif.nif_obv/2)
  end

  @dialyzer {:nowarn_function, plus_di: 1}
  @spec plus_di([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Plus Directional Indicator

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_PLUS_DI`
  """
  def plus_di(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_plus_di/4)
  end

  @dialyzer {:nowarn_function, plus_dm: 1}
  @spec plus_dm([{:high, [number()]} | {:low, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Plus Directional Movement

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_PLUS_DM`
  """
  def plus_dm(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_plus_dm/3)
  end

  @dialyzer {:nowarn_function, ppo: 1}
  @spec ppo([
          {:values, [number()]}
          | {:fast_period, pos_integer()}
          | {:slow_period, pos_integer()}
          | {:moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Percentage Price Oscillator

  ---
  Inputs
  - `values`
  - `fast_period` (default `5`): Number of period for the fast MA (between `2` and `100000`)
  - `slow_period` (default `15`): Number of period for the slow MA (between `2` and `100000`)
  - `moving_average_type` (default `:sma`): Type of moving average. `sma` | `ema` | `wma` | `dema` | `tema` | `trima` | `kama` | `mama` | `t3`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_PPO`
  """
  def ppo(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:fast_period, :integer, %{default: 5, min: 2, max: 100_000})
    |> Executer.load(:slow_period, :integer, %{default: 15, min: 2, max: 100_000})
    |> Executer.load(:moving_average_type, :ma_type, %{default: :sma})
    |> Executer.call(&Nif.nif_ppo/4)
  end

  @dialyzer {:nowarn_function, roc: 1}
  @spec roc([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Rate of change : ((price/prevPrice)-1)*100

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ROC`
  """
  def roc(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_roc/2)
  end

  @dialyzer {:nowarn_function, rocp: 1}
  @spec rocp([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Rate of change Percentage: (price-prevPrice)/prevPrice

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ROCP`
  """
  def rocp(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_rocp/2)
  end

  @dialyzer {:nowarn_function, rocr: 1}
  @spec rocr([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Rate of change ratio: (price/prevPrice)

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ROCR`
  """
  def rocr(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_rocr/2)
  end

  @dialyzer {:nowarn_function, rocr100: 1}
  @spec rocr100([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Rate of change ratio 100 scale: (price/prevPrice)*100

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ROCR100`
  """
  def rocr100(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_rocr100/2)
  end

  @dialyzer {:nowarn_function, rsi: 1}
  @spec rsi([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Relative Strength Index

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_RSI`
  """
  def rsi(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_rsi/2)
  end

  @dialyzer {:nowarn_function, sar: 1}
  @spec sar([
          {:high, [number()]}
          | {:low, [number()]}
          | {:acceleration, number()}
          | {:maximum, number()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Parabolic SAR

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `acceleration` (default `0`): Acceleration Factor used up to the Maximum value (minuimum `0`)
  - `maximum` (default `0`): Acceleration Factor Maximum value (minuimum `0`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_SAR`
  """
  def sar(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:acceleration, :double, %{default: 0, min: 0})
    |> Executer.load(:maximum, :double, %{default: 0, min: 0})
    |> Executer.call(&Nif.nif_sar/4)
  end

  @dialyzer {:nowarn_function, sarext: 1}
  @spec sarext([
          {:high, [number()]}
          | {:low, [number()]}
          | {:start_value, number()}
          | {:offset_on_reverse, number()}
          | {:acceleration_init_long, number()}
          | {:acceleration_long, number()}
          | {:acceleration_max_long, number()}
          | {:acceleration_init_short, number()}
          | {:acceleration_short, number()}
          | {:acceleration_max_short, number()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Parabolic SAR - Extended

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `start_value` (default `0`): Start value and direction. 0 for Auto, >0 for Long, <0 for Short
  - `offset_on_reverse` (default `0`): Percent offset added/removed to initial stop on short/long reversal (minuimum `0`)
  - `acceleration_init_long` (default `0`): Acceleration Factor initial value for the Long direction (minuimum `0`)
  - `acceleration_long` (default `0`): Acceleration Factor for the Long direction (minuimum `0`)
  - `acceleration_max_long` (default `0`): Acceleration Factor maximum value for the Long direction (minuimum `0`)
  - `acceleration_init_short` (default `0`): Acceleration Factor initial value for the Short direction (minuimum `0`)
  - `acceleration_short` (default `0`): Acceleration Factor for the Short direction (minuimum `0`)
  - `acceleration_max_short` (default `0`): Acceleration Factor maximum value for the Short direction (minuimum `0`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_SAREXT`
  """
  def sarext(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:start_value, :double, %{default: 0})
    |> Executer.load(:offset_on_reverse, :double, %{default: 0, min: 0})
    |> Executer.load(:acceleration_init_long, :double, %{default: 0, min: 0})
    |> Executer.load(:acceleration_long, :double, %{default: 0, min: 0})
    |> Executer.load(:acceleration_max_long, :double, %{default: 0, min: 0})
    |> Executer.load(:acceleration_init_short, :double, %{default: 0, min: 0})
    |> Executer.load(:acceleration_short, :double, %{default: 0, min: 0})
    |> Executer.load(:acceleration_max_short, :double, %{default: 0, min: 0})
    |> Executer.call(&Nif.nif_sarext/10)
  end

  @dialyzer {:nowarn_function, sin: 1}
  @spec sin([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric Sin

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_SIN`
  """
  def sin(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_sin/1)
  end

  @dialyzer {:nowarn_function, sinh: 1}
  @spec sinh([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric Sinh

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_SINH`
  """
  def sinh(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_sinh/1)
  end

  @dialyzer {:nowarn_function, sma: 1}
  @spec sma([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Simple Moving Average

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_SMA`
  """
  def sma(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_sma/2)
  end

  @dialyzer {:nowarn_function, sqrt: 1}
  @spec sqrt([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Square Root

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_SQRT`
  """
  def sqrt(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_sqrt/1)
  end

  @dialyzer {:nowarn_function, stddev: 1}
  @spec stddev([
          {:values, [number()]}
          | {:time_period, pos_integer()}
          | {:number_of_deviations, number()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Standard Deviation

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)
  - `number_of_deviations`: Number of deviations

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_STDDEV`
  """
  def stddev(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.load(:number_of_deviations, :double)
    |> Executer.call(&Nif.nif_stddev/3)
  end

  @dialyzer {:nowarn_function, stoch: 1}
  @spec stoch([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:fast_k_period, pos_integer()}
          | {:slow_k_period, pos_integer()}
          | {:slow_k_moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
          | {:slow_d_period, pos_integer()}
          | {:slow_d_moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, slow_k :: [number() | :nan], slow_d :: [number() | :nan]} | {:error, term()}
  @doc """
  Stochastic

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `fast_k_period`: Time period for building the Fast-K line (between `1` and `100000`)
  - `slow_k_period`: Smoothing for making the Slow-K line. Usually set to 3 (between `1` and `100000`)
  - `slow_k_moving_average_type` (default `:sma`): Type of Moving Average for Slow-K
  - `slow_d_period`: Smoothing for making the Slow-D line (between `1` and `100000`)
  - `slow_d_moving_average_type` (default `:sma`): Type of Moving Average for Slow-K

  ---
  Outputs
  - `slow_k`
  - `slow_d`

  ---
  TA-LIB src `TA_STOCH`
  """
  def stoch(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:fast_k_period, :integer, %{min: 1, max: 100_000})
    |> Executer.load(:slow_k_period, :integer, %{min: 1, max: 100_000})
    |> Executer.load(:slow_k_moving_average_type, :ma_type, %{default: :sma})
    |> Executer.load(:slow_d_period, :integer, %{min: 1, max: 100_000})
    |> Executer.load(:slow_d_moving_average_type, :ma_type, %{default: :sma})
    |> Executer.call(&Nif.nif_stoch/8)
  end

  @dialyzer {:nowarn_function, stochf: 1}
  @spec stochf([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:fast_k_period, pos_integer()}
          | {:fast_d_period, pos_integer()}
          | {:fast_d_moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, fast_k :: [number() | :nan], fast_d :: [number() | :nan]} | {:error, term()}
  @doc """
  Stochastic Fast

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `fast_k_period`: Time period for building the Fast-K line (between `1` and `100000`)
  - `fast_d_period`: Smoothing for making the Fast-D line. Usually set to 3 (between `1` and `100000`)
  - `fast_d_moving_average_type` (default `:sma`): Type of Moving Average for Fast-D

  ---
  Outputs
  - `fast_k`
  - `fast_d`

  ---
  TA-LIB src `TA_STOCHF`
  """
  def stochf(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:fast_k_period, :integer, %{min: 1, max: 100_000})
    |> Executer.load(:fast_d_period, :integer, %{min: 1, max: 100_000})
    |> Executer.load(:fast_d_moving_average_type, :ma_type, %{default: :sma})
    |> Executer.call(&Nif.nif_stochf/6)
  end

  @dialyzer {:nowarn_function, stochrsi: 1}
  @spec stochrsi([
          {:values, [number()]}
          | {:time_period, pos_integer()}
          | {:fast_k_period, pos_integer()}
          | {:fast_d_period, pos_integer()}
          | {:fast_d_moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, fast_k :: [number() | :nan], fast_d :: [number() | :nan]} | {:error, term()}
  @doc """
  Stochastic Relative Strength Index

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)
  - `fast_k_period`: Time period for building the Fast-K line (between `1` and `100000`)
  - `fast_d_period`: Smoothing for making the Fast-D line. Usually set to 3 (between `1` and `100000`)
  - `fast_d_moving_average_type` (default `:sma`): Type of Moving Average for Fast-D

  ---
  Outputs
  - `fast_k`
  - `fast_d`

  ---
  TA-LIB src `TA_STOCHRSI`
  """
  def stochrsi(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.load(:fast_k_period, :integer, %{min: 1, max: 100_000})
    |> Executer.load(:fast_d_period, :integer, %{min: 1, max: 100_000})
    |> Executer.load(:fast_d_moving_average_type, :ma_type, %{default: :sma})
    |> Executer.call(&Nif.nif_stochrsi/5)
  end

  @dialyzer {:nowarn_function, sub: 1}
  @spec sub([{:values0, [number()]} | {:values1, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Arithmetic Substraction

  ---
  Inputs
  - `values0`
  - `values1`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_SUB`
  """
  def sub(params) do
    params
    |> Executer.new()
    |> Executer.load(:values0, :double_array)
    |> Executer.load(:values1, :double_array)
    |> Executer.call(&Nif.nif_sub/2)
  end

  @dialyzer {:nowarn_function, sum: 1}
  @spec sum([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Summation

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_SUM`
  """
  def sum(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_sum/2)
  end

  @dialyzer {:nowarn_function, t3: 1}
  @spec t3([{:values, [number()]} | {:time_period, pos_integer()} | {:v_factor, number()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Triple Exponential Moving Average (T3)

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)
  - `v_factor`: Volume Factor (between `0` and `1`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_T3`
  """
  def t3(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.load(:v_factor, :double, %{min: 0, max: 1})
    |> Executer.call(&Nif.nif_t3/3)
  end

  @dialyzer {:nowarn_function, tan: 1}
  @spec tan([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric Tan

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_TAN`
  """
  def tan(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_tan/1)
  end

  @dialyzer {:nowarn_function, tanh: 1}
  @spec tanh([{:values, [number()]}]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric Tanh

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_TANH`
  """
  def tanh(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_tanh/1)
  end

  @dialyzer {:nowarn_function, tema: 1}
  @spec tema([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Triple Exponential Moving Average

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_TEMA`
  """
  def tema(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_tema/2)
  end

  @dialyzer {:nowarn_function, trange: 1}
  @spec trange([{:high, [number()]} | {:low, [number()]} | {:close, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  True Range

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_TRANGE`
  """
  def trange(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_trange/3)
  end

  @dialyzer {:nowarn_function, trima: 1}
  @spec trima([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Triangular Moving Average

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_TRIMA`
  """
  def trima(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_trima/2)
  end

  @dialyzer {:nowarn_function, trix: 1}
  @spec trix([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  1-day Rate-Of-Change (ROC) of a Triple Smooth EMA

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_TRIX`
  """
  def trix(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_trix/2)
  end

  @dialyzer {:nowarn_function, tsf: 1}
  @spec tsf([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Time Series Forecast

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_TSF`
  """
  def tsf(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_tsf/2)
  end

  @dialyzer {:nowarn_function, typprice: 1}
  @spec typprice([{:high, [number()]} | {:low, [number()]} | {:close, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Typical Price

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_TYPPRICE`
  """
  def typprice(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_typprice/3)
  end

  @dialyzer {:nowarn_function, ultosc: 1}
  @spec ultosc([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period1, pos_integer()}
          | {:time_period2, pos_integer()}
          | {:time_period3, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Ultimate Oscillator

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period1`: Number of bars for 1st period (between `1` and `100000`)
  - `time_period2`: Number of bars for 2nd period (between `1` and `100000`)
  - `time_period3`: Number of bars for 3rd period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_ULTOSC`
  """
  def ultosc(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period1, :integer, %{min: 1, max: 100_000})
    |> Executer.load(:time_period2, :integer, %{min: 1, max: 100_000})
    |> Executer.load(:time_period3, :integer, %{min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_ultosc/6)
  end

  @dialyzer {:nowarn_function, var: 1}
  @spec var([
          {:values, [number()]}
          | {:time_period, pos_integer()}
          | {:number_of_deviations, number()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Variance

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)
  - `number_of_deviations`: Number of deviations

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_VAR`
  """
  def var(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.load(:number_of_deviations, :double)
    |> Executer.call(&Nif.nif_var/3)
  end

  @dialyzer {:nowarn_function, wclprice: 1}
  @spec wclprice([{:high, [number()]} | {:low, [number()]} | {:close, [number()]}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Weighted Close Price

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_WCLPRICE`
  """
  def wclprice(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.call(&Nif.nif_wclprice/3)
  end

  @dialyzer {:nowarn_function, willr: 1}
  @spec willr([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:time_period, pos_integer()}
        ]) :: {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Williams' %R

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `close`: Close Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_WILLR`
  """
  def willr(params) do
    params
    |> Executer.new()
    |> Executer.load(:high, :double_array)
    |> Executer.load(:low, :double_array)
    |> Executer.load(:close, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_willr/4)
  end

  @dialyzer {:nowarn_function, wma: 1}
  @spec wma([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, result :: [number() | :nan]} | {:error, term()}
  @doc """
  Weighted Moving Average

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `result`

  ---
  TA-LIB src `TA_WMA`
  """
  def wma(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_wma/2)
  end
end