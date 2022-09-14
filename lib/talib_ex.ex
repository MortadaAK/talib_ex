defmodule TalibEx do
  @moduledoc """
  Interface for talib
  """
  alias TalibEx.{Nif, Executer}

  @dialyzer {:nowarn_function, acos: 1}
  @spec acos([{:values, [number()]}]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric ACos

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `list`
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
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
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
  - `list`
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
          {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Arithmetic Add

  ---
  Inputs
  - `values0`
  - `values1`

  ---
  Outputs
  - `list`
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
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
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
  - `list`
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
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
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
  - `list`
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
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
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
  - `list`
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
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
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
  - `list`
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
          {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc """
  Aroon Oscillator

  ---
  Inputs
  - `high`: High Price List
  - `low`: Low Price List
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `list`
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
  @spec asin([{:values, [number()]}]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric ASin

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `list`
  """
  def asin(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_asin/1)
  end

  @dialyzer {:nowarn_function, atan: 1}
  @spec atan([{:values, [number()]}]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Trigonometric ATan

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `list`
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
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
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
  - `list`
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
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
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
  - `list`
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
          {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc """
  Beta

  ---
  Inputs
  - `values0`
  - `values1`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `list`
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
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
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
  - `list`
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
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
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
  - `list`
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

  @dialyzer {:nowarn_function, sma: 1}
  @spec sma([{:values, [number()]} | {:time_period, pos_integer()}]) ::
          {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc """
  Simple Moving Average

  ---
  Inputs
  - `values`
  - `time_period` (default `5`): Number of period (between `1` and `100000`)

  ---
  Outputs
  - `list`
  """
  def sma(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.load(:time_period, :integer, %{default: 5, min: 1, max: 100_000})
    |> Executer.call(&Nif.nif_sma/2)
  end

  @dialyzer {:nowarn_function, sqrt: 1}
  @spec sqrt([{:values, [number()]}]) :: {:ok, window :: [number() | :nan]} | {:error, term()}
  @doc """
  Vector Square Root

  ---
  Inputs
  - `values`

  ---
  Outputs
  - `window`
  """
  def sqrt(params) do
    params
    |> Executer.new()
    |> Executer.load(:values, :double_array)
    |> Executer.call(&Nif.nif_sqrt/1)
  end
end