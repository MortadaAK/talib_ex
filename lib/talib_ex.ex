defmodule TalibEx do
  @moduledoc """
  Interface for talib
  """
  alias TalibEx.Nif

  @dialyzer {:nowarn_function, acos: 1}
  @spec acos([{:list, [number()]}]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Vector Trigonometric ACos"
  def acos(params) do
    list = Keyword.fetch!(params, :list)

    Nif.nif_acos(list)
  end

  @dialyzer {:nowarn_function, ad: 1}
  @spec ad([
          {:high, [number()]} | {:low, [number()]} | {:close, [number()]} | {:volume, [number()]}
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Chaikin A/D Line"
  def ad(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    volume = Keyword.fetch!(params, :volume)

    Nif.nif_ad(high, low, close, volume)
  end

  @dialyzer {:nowarn_function, add: 1}
  @spec add([{:list1, [number()]} | {:list2, [number()]}]) ::
          {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Vector Arithmetic Add"
  def add(params) do
    list1 = Keyword.fetch!(params, :list1)
    list2 = Keyword.fetch!(params, :list2)

    Nif.nif_add(list1, list2)
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

  @dialyzer {:nowarn_function, adx: 1}
  @spec adx([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:window, pos_integer()}
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Average Directional Movement Index"
  def adx(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    window = Keyword.fetch!(params, :window)

    Nif.nif_adx(high, low, close, window)
  end

  @dialyzer {:nowarn_function, adxr: 1}
  @spec adxr([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:window, pos_integer()}
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Average Directional Movement Index Rating"
  def adxr(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    window = Keyword.fetch!(params, :window)

    Nif.nif_adxr(high, low, close, window)
  end

  @dialyzer {:nowarn_function, apo: 1}
  @spec apo([
          {:list, [number()]}
          | {:fast_period, pos_integer()}
          | {:slow_period, pos_integer()}
          | {:moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Absolute Price Oscillator"
  def apo(params) do
    list = Keyword.fetch!(params, :list)
    fast_period = Keyword.fetch!(params, :fast_period)
    slow_period = Keyword.fetch!(params, :slow_period)
    moving_average_type = Keyword.fetch!(params, :moving_average_type)

    Nif.nif_apo(list, fast_period, slow_period, moving_average_type)
  end

  @dialyzer {:nowarn_function, aroon: 1}
  @spec aroon([{:high, [number()]} | {:low, [number()]} | {:window, pos_integer()}]) ::
          {:ok, down :: [number() | :nan], up :: [number() | :nan]} | {:error, term()}
  @doc "Aroon"
  def aroon(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    window = Keyword.fetch!(params, :window)

    Nif.nif_aroon(high, low, window)
  end

  @dialyzer {:nowarn_function, aroonosc: 1}
  @spec aroonosc([{:high, [number()]} | {:low, [number()]} | {:window, pos_integer()}]) ::
          {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Aroon Oscillator"
  def aroonosc(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    window = Keyword.fetch!(params, :window)

    Nif.nif_aroonosc(high, low, window)
  end

  @dialyzer {:nowarn_function, asin: 1}
  @spec asin([{:list, [number()]}]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Vector Trigonometric ASin"
  def asin(params) do
    list = Keyword.fetch!(params, :list)

    Nif.nif_asin(list)
  end

  @dialyzer {:nowarn_function, atan: 1}
  @spec atan([{:list, [number()]}]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Vector Trigonometric ATan"
  def atan(params) do
    list = Keyword.fetch!(params, :list)

    Nif.nif_atan(list)
  end

  @dialyzer {:nowarn_function, atr: 1}
  @spec atr([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:window, pos_integer()}
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Average True Range"
  def atr(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    window = Keyword.fetch!(params, :window)

    Nif.nif_atr(high, low, close, window)
  end

  @dialyzer {:nowarn_function, avgprice: 1}
  @spec avgprice([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Average Price"
  def avgprice(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_avgprice(open, high, low, close)
  end

  @dialyzer {:nowarn_function, bbands: 1}
  @spec bbands([
          {:list, [number()]}
          | {:window, pos_integer()}
          | {:np_dev_up, number()}
          | {:np_dev_down, number()}
          | {:moving_average_type,
             :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) ::
          {:ok, upper :: [number() | :nan], middle :: [number() | :nan],
           lower :: [number() | :nan]}
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

  @dialyzer {:nowarn_function, beta: 1}
  @spec beta([{:list1, [number()]} | {:list2, [number()]} | {:window, pos_integer()}]) ::
          {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Beta"
  def beta(params) do
    list1 = Keyword.fetch!(params, :list1)
    list2 = Keyword.fetch!(params, :list2)
    window = Keyword.fetch!(params, :window)

    Nif.nif_beta(list1, list2, window)
  end

  @dialyzer {:nowarn_function, bop: 1}
  @spec bop([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Balance Of Power"
  def bop(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_bop(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cci: 1}
  @spec cci([
          {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:window, pos_integer()}
        ]) :: {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Commodity Channel Index"
  def cci(params) do
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    window = Keyword.fetch!(params, :window)

    Nif.nif_cci(high, low, close, window)
  end

  @dialyzer {:nowarn_function, cdl2_crows: 1}
  @spec cdl2_crows([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Two Crows"
  def cdl2_crows(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl2_crows(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl3_black_crows: 1}
  @spec cdl3_black_crows([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Three Black Crows"
  def cdl3_black_crows(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl3_black_crows(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl3_inside: 1}
  @spec cdl3_inside([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Three Inside Up/Down"
  def cdl3_inside(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl3_inside(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl3_line_strike: 1}
  @spec cdl3_line_strike([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Three-Line Strike"
  def cdl3_line_strike(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl3_line_strike(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl3_outside: 1}
  @spec cdl3_outside([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Three Outside Up/Down"
  def cdl3_outside(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl3_outside(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl3_stars_in_south: 1}
  @spec cdl3_stars_in_south([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Three Stars In The South"
  def cdl3_stars_in_south(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl3_stars_in_south(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl3_white_soldiers: 1}
  @spec cdl3_white_soldiers([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Three Advancing White Soldiers"
  def cdl3_white_soldiers(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl3_white_soldiers(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_abandoned_baby: 1}
  @spec cdl_abandoned_baby([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:penetration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Abandoned Baby"
  def cdl_abandoned_baby(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    penetration = Keyword.fetch!(params, :penetration)

    Nif.nif_cdl_abandoned_baby(open, high, low, close, penetration)
  end

  @dialyzer {:nowarn_function, cdl_advance_block: 1}
  @spec cdl_advance_block([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Advance Block"
  def cdl_advance_block(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_advance_block(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_belt_hold: 1}
  @spec cdl_belt_hold([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Belt-hold"
  def cdl_belt_hold(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_belt_hold(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_breakaway: 1}
  @spec cdl_breakaway([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Breakaway"
  def cdl_breakaway(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_breakaway(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_closing_marubozu: 1}
  @spec cdl_closing_marubozu([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Closing Marubozu"
  def cdl_closing_marubozu(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_closing_marubozu(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_conceal_baby_swallow: 1}
  @spec cdl_conceal_baby_swallow([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Concealing Baby Swallow"
  def cdl_conceal_baby_swallow(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_conceal_baby_swallow(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_counterattack: 1}
  @spec cdl_counterattack([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Counterattack"
  def cdl_counterattack(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_counterattack(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_dark_cloud_cover: 1}
  @spec cdl_dark_cloud_cover([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:peneration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Dark Cloud Cover"
  def cdl_dark_cloud_cover(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    peneration = Keyword.fetch!(params, :peneration)

    Nif.nif_cdl_dark_cloud_cover(open, high, low, close, peneration)
  end

  @dialyzer {:nowarn_function, cdl_doji: 1}
  @spec cdl_doji([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Doji"
  def cdl_doji(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_doji(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_doji_star: 1}
  @spec cdl_doji_star([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Doji Star"
  def cdl_doji_star(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_doji_star(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_dragonfly_doji: 1}
  @spec cdl_dragonfly_doji([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Dragonfly Doji"
  def cdl_dragonfly_doji(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_dragonfly_doji(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_engulfing: 1}
  @spec cdl_engulfing([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Engulfing Pattern"
  def cdl_engulfing(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_engulfing(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_evening_doji_star: 1}
  @spec cdl_evening_doji_star([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:peneration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Evening Doji Star"
  def cdl_evening_doji_star(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    peneration = Keyword.fetch!(params, :peneration)

    Nif.nif_cdl_evening_doji_star(open, high, low, close, peneration)
  end

  @dialyzer {:nowarn_function, cdl_evening_star: 1}
  @spec cdl_evening_star([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:peneration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Evening Star"
  def cdl_evening_star(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    peneration = Keyword.fetch!(params, :peneration)

    Nif.nif_cdl_evening_star(open, high, low, close, peneration)
  end

  @dialyzer {:nowarn_function, cdl_gap_side_side_white: 1}
  @spec cdl_gap_side_side_white([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Up/Down-gap side-by-side white lines"
  def cdl_gap_side_side_white(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_gap_side_side_white(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_gravestone_doji: 1}
  @spec cdl_gravestone_doji([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Gravestone Doji"
  def cdl_gravestone_doji(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_gravestone_doji(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_hammer: 1}
  @spec cdl_hammer([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Hammer"
  def cdl_hammer(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_hammer(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_hanging_man: 1}
  @spec cdl_hanging_man([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Hanging Man"
  def cdl_hanging_man(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_hanging_man(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_harami: 1}
  @spec cdl_harami([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Harami Pattern"
  def cdl_harami(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_harami(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_harami_cross: 1}
  @spec cdl_harami_cross([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Harami Cross Pattern"
  def cdl_harami_cross(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_harami_cross(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_highwave: 1}
  @spec cdl_highwave([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "High-Wave Candle"
  def cdl_highwave(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_highwave(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_hikkake: 1}
  @spec cdl_hikkake([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Hikkake Pattern"
  def cdl_hikkake(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_hikkake(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_hikkake_mod: 1}
  @spec cdl_hikkake_mod([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Modified Hikkake Pattern"
  def cdl_hikkake_mod(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_hikkake_mod(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_homing_pigeon: 1}
  @spec cdl_homing_pigeon([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Homing Pigeon"
  def cdl_homing_pigeon(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_homing_pigeon(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_identical_3_crows: 1}
  @spec cdl_identical_3_crows([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Identical Three Crows"
  def cdl_identical_3_crows(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_identical_3_crows(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_inneck: 1}
  @spec cdl_inneck([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "In-Neck Pattern"
  def cdl_inneck(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_inneck(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_inverted_hammer: 1}
  @spec cdl_inverted_hammer([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Inverted Hammer"
  def cdl_inverted_hammer(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_inverted_hammer(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_kicking: 1}
  @spec cdl_kicking([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Kicking"
  def cdl_kicking(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_kicking(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_kicking_by_length: 1}
  @spec cdl_kicking_by_length([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Kicking - bull/bear determined by the longer marubozu"
  def cdl_kicking_by_length(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_kicking_by_length(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_ladder_bottom: 1}
  @spec cdl_ladder_bottom([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Ladder Bottom"
  def cdl_ladder_bottom(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_ladder_bottom(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_long_legged_doji: 1}
  @spec cdl_long_legged_doji([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Long Legged Doji"
  def cdl_long_legged_doji(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_long_legged_doji(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_long_line: 1}
  @spec cdl_long_line([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Long Line Candle"
  def cdl_long_line(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_long_line(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_marubozu: 1}
  @spec cdl_marubozu([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Marubozu"
  def cdl_marubozu(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_marubozu(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_matching_low: 1}
  @spec cdl_matching_low([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Matching Low"
  def cdl_matching_low(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_matching_low(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_mat_hold: 1}
  @spec cdl_mat_hold([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:penetration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Mat Hold"
  def cdl_mat_hold(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    penetration = Keyword.fetch!(params, :penetration)

    Nif.nif_cdl_mat_hold(open, high, low, close, penetration)
  end

  @dialyzer {:nowarn_function, cdl_morning_doji_star: 1}
  @spec cdl_morning_doji_star([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:penetration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Morning Doji Star"
  def cdl_morning_doji_star(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    penetration = Keyword.fetch!(params, :penetration)

    Nif.nif_cdl_morning_doji_star(open, high, low, close, penetration)
  end

  @dialyzer {:nowarn_function, cdl_morning_star: 1}
  @spec cdl_morning_star([
          {:open, [number()]}
          | {:high, [number()]}
          | {:low, [number()]}
          | {:close, [number()]}
          | {:penetration, number()}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Morning Star"
  def cdl_morning_star(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)
    penetration = Keyword.fetch!(params, :penetration)

    Nif.nif_cdl_morning_star(open, high, low, close, penetration)
  end

  @dialyzer {:nowarn_function, cdl_on_neck: 1}
  @spec cdl_on_neck([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "On-Neck Pattern"
  def cdl_on_neck(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_on_neck(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_piercing: 1}
  @spec cdl_piercing([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Piercing Pattern"
  def cdl_piercing(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_piercing(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_rickshaw_man: 1}
  @spec cdl_rickshaw_man([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Rickshaw Man"
  def cdl_rickshaw_man(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_rickshaw_man(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_rise_fall_3_methods: 1}
  @spec cdl_rise_fall_3_methods([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Rickshaw Man"
  def cdl_rise_fall_3_methods(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_rise_fall_3_methods(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_separating_lines: 1}
  @spec cdl_separating_lines([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Separating Lines"
  def cdl_separating_lines(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_separating_lines(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_shooting_star: 1}
  @spec cdl_shooting_star([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Shooting Star"
  def cdl_shooting_star(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_shooting_star(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_short_line: 1}
  @spec cdl_short_line([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Short Line Candle"
  def cdl_short_line(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_short_line(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_spinning_top: 1}
  @spec cdl_spinning_top([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Spinning Top"
  def cdl_spinning_top(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_spinning_top(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_stalled_pattern: 1}
  @spec cdl_stalled_pattern([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Stalled Pattern"
  def cdl_stalled_pattern(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_stalled_pattern(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_stick_sandwich: 1}
  @spec cdl_stick_sandwich([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Stick Sandwich"
  def cdl_stick_sandwich(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_stick_sandwich(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_takuri: 1}
  @spec cdl_takuri([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Takuri (Dragonfly Doji with very long lower shadow)"
  def cdl_takuri(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_takuri(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_tasuki_gap: 1}
  @spec cdl_tasuki_gap([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Tasuki Gap"
  def cdl_tasuki_gap(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_tasuki_gap(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_thrusting: 1}
  @spec cdl_thrusting([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Thrusting Pattern"
  def cdl_thrusting(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_thrusting(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_tri_star: 1}
  @spec cdl_tri_star([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Tristar Pattern"
  def cdl_tri_star(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_tri_star(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_unique_3_river: 1}
  @spec cdl_unique_3_river([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Unique 3 River"
  def cdl_unique_3_river(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_unique_3_river(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_upside_gap_2_crows: 1}
  @spec cdl_upside_gap_2_crows([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Upside Gap Two Crows"
  def cdl_upside_gap_2_crows(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_upside_gap_2_crows(open, high, low, close)
  end

  @dialyzer {:nowarn_function, cdl_upside_downside_gap_3_methods: 1}
  @spec cdl_upside_downside_gap_3_methods([
          {:open, [number()]} | {:high, [number()]} | {:low, [number()]} | {:close, [number()]}
        ]) :: {:ok, list :: [integer() | :nan]} | {:error, term()}
  @doc "Upside/Downside Gap Three Methods"
  def cdl_upside_downside_gap_3_methods(params) do
    open = Keyword.fetch!(params, :open)
    high = Keyword.fetch!(params, :high)
    low = Keyword.fetch!(params, :low)
    close = Keyword.fetch!(params, :close)

    Nif.nif_cdl_upside_downside_gap_3_methods(open, high, low, close)
  end

  @dialyzer {:nowarn_function, sma: 1}
  @spec sma([{:list, [number()]} | {:window, pos_integer()}]) ::
          {:ok, list :: [number() | :nan]} | {:error, term()}
  @doc "Simple Moving Average"
  def sma(params) do
    list = Keyword.fetch!(params, :list)
    window = Keyword.fetch!(params, :window)

    Nif.nif_sma(list, window)
  end

  @dialyzer {:nowarn_function, sqrt: 1}
  @spec sqrt([{:list, [number()]}]) :: {:ok, window :: [number() | :nan]} | {:error, term()}
  @doc "Vector Square Root"
  def sqrt(params) do
    list = Keyword.fetch!(params, :list)

    Nif.nif_sqrt(list)
  end
end