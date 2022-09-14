defmodule TalibEx do
  @moduledoc """
  Interface for talib
  """
  alias TalibEx.Nif

  @spec acos([{:list, [number()]}]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Vector Trigonometric ACos"
  def acos(params) do
    list = Keyword.fetch!(params, :list)

    Nif.nif_acos(list)
  end

  @spec ad([
          {:high, [number()]} | {:low, [number()]} | {:close, [number()]} | {:volume, [number()]}
        ]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Chaikin A/D Line"
  def ad(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    volume = Keyword.fetch!(params, :volume)

    Nif.nif_ad(high, low, close, volume)
  end

  @spec add([{:list1, [number()]} | {:list2, [number()]}]) ::
          {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Vector Arithmetic Add"
  def add(params) do
    list1 = Keyword.fetch!(params, :list1)
    list2 = Keyword.fetch!(params, :list2)

    Nif.nif_add(list1, list2)
  end

  @spec adosc([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:volume, [number()]}
          | {:fast_period, pos_integer()}
          | {:slow_period, pos_integer()}
        ]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Chaikin A/D Oscillator"
  def adosc(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    volume = Keyword.fetch!(params, :volume)
    fast_period = Keyword.fetch!(params, :fast_period)
    slow_period = Keyword.fetch!(params, :slow_period)

    Nif.nif_adosc(high, low, close, volume, fast_period, slow_period)
  end

  @spec adx([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:window, pos_integer()}
        ]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Average Directional Movement Index"
  def adx(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    window = Keyword.fetch!(params, :window)

    Nif.nif_adx(high, low, close, window)
  end

  @spec adxr([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:window, pos_integer()}
        ]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Average Directional Movement Index Rating"
  def adxr(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    window = Keyword.fetch!(params, :window)

    Nif.nif_adxr(high, low, close, window)
  end

  @spec apo([
          {:list, [number()]}
          | {:fast_period, pos_integer()}
          | {:slow_period, pos_integer()}
          | {:moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Absolute Price Oscillator"
  def apo(params) do
    list = Keyword.fetch!(params, :list)
    fast_period = Keyword.fetch!(params, :fast_period)
    slow_period = Keyword.fetch!(params, :slow_period)
    moving_average_type = Keyword.fetch!(params, :moving_average_type)

    Nif.nif_apo(list, fast_period, slow_period, moving_average_type)
  end

  @spec aroon([{:high, [number()]} | {:low, [number()]} | {:window, pos_integer()}]) ::
          {:ok, out0 :: [number() | :nan], out1 :: [number() | :nan]} | {:error, term()}
  @doc "Aroon"
  def aroon(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    window = Keyword.fetch!(params, :window)

    Nif.nif_aroon(high, low, window)
  end

  @spec aroonosc([{:high, [number()]} | {:low, [number()]} | {:window, pos_integer()}]) ::
          {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Aroon Oscillator"
  def aroonosc(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    window = Keyword.fetch!(params, :window)

    Nif.nif_aroonosc(high, low, window)
  end

  @spec asin([{:list, [number()]}]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Vector Trigonometric ASin"
  def asin(params) do
    list = Keyword.fetch!(params, :list)

    Nif.nif_asin(list)
  end

  @spec atan([{:list, [number()]}]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Vector Trigonometric ATan"
  def atan(params) do
    list = Keyword.fetch!(params, :list)

    Nif.nif_atan(list)
  end

  @spec atr([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:window, pos_integer()}
        ]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Average True Range"
  def atr(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    window = Keyword.fetch!(params, :window)

    Nif.nif_atr(high, low, close, window)
  end

  @spec avgprice([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Average Price"
  def avgprice(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_avgprice(open, high, low, close)
  end

  @spec bbands([
          {:list, [number()]}
          | {:window, pos_integer()}
          | {:np_dev_up, number()}
          | {:np_dev_down, number()}
          | {:moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) ::
          {:ok, out0 :: [number() | :nan], out1 :: [number() | :nan], out2 :: [number() | :nan]}
          | {:error, term()}
  @doc "Bollinger Bands"
  def bbands(params) do
    list = Keyword.fetch!(params, :list)
    window = Keyword.fetch!(params, :window)
    np_dev_up = Keyword.fetch!(params, :np_dev_up)
    np_dev_down = Keyword.fetch!(params, :np_dev_down)
    moving_average_type = Keyword.fetch!(params, :moving_average_type)

    Nif.nif_bbands(list, window, np_dev_up, np_dev_down, moving_average_type)
  end

  @spec beta([{:list1, [number()]} | {:list2, [number()]} | {:window, pos_integer()}]) ::
          {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Beta"
  def beta(params) do
    list1 = Keyword.fetch!(params, :list1)
    list2 = Keyword.fetch!(params, :list2)
    window = Keyword.fetch!(params, :window)

    Nif.nif_beta(list1, list2, window)
  end

  @spec bop([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Balance Of Power"
  def bop(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_bop(open, high, low, close)
  end

  @spec sma([{:list, [number()]} | {:window, pos_integer()}]) ::
          {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Simple Moving Average"
  def sma(params) do
    list = Keyword.fetch!(params, :list)
    window = Keyword.fetch!(params, :window)

    Nif.nif_sma(list, window)
  end

  @spec sqrt([{:list, [number()]}]) :: {:ok, out0 :: [number() | :nan]} | {:error, term()}
  @doc "Vector Square Root"
  def sqrt(params) do
    list = Keyword.fetch!(params, :list)

    Nif.nif_sqrt(list)
  end
end