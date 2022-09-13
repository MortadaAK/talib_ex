defmodule TalibEx do
  @moduledoc """
  Documentation for `TalibEx`.
  """
  alias TalibEx.Nif
  @type numbers_nan_list :: [:nan | number()]
  @type list_of_numbers :: [number()] | Range.t()
  @type hlw :: [
          high: list_of_numbers(),
          low: list_of_numbers(),
          close: list_of_numbers()
        ]
  @type hlcv :: [
          volume: list_of_numbers(),
          high: list_of_numbers(),
          low: list_of_numbers(),
          close: list_of_numbers()
        ]
  @type ohlc :: [
          open: list_of_numbers(),
          high: list_of_numbers(),
          low: list_of_numbers(),
          close: list_of_numbers()
        ]
  @type ohlcv :: [
          open: list_of_numbers(),
          high: list_of_numbers(),
          low: list_of_numbers(),
          close: list_of_numbers(),
          volume: list_of_numbers()
        ]
  @type hlc :: [
          high: list_of_numbers(),
          low: list_of_numbers(),
          close: list_of_numbers()
        ]

  @spec acos(list_of_numbers) ::
          {:ok, numbers_nan_list} | {:error, term}

  defguardp int_2_to_100000(value) when is_integer(value) and value >= 2 and value <= 100_000

  @doc "Vector Trigonometric ACos"
  def acos(list) do
    with {:ok, %{list: list}} <- load_lists([list: list], [:list]),
         {:ok, [result]} <- Nif.nif_acos(list) do
      {:ok, result}
    else
      error ->
        error
    end
  end

  @spec ad(hlcv) ::
          {:ok, numbers_nan_list} | {:error, term}
  @doc "Chaikin A/D Line"
  def ad(opts) do
    with {:ok, %{volume: volume, low: low, high: high, close: close}} <- hlcv(opts),
         {:ok, [result]} <- Nif.nif_ad(high, low, close, volume) do
      {:ok, result}
    else
      error ->
        error
    end
  end

  @spec add(list_of_numbers(), list_of_numbers()) :: {:ok, numbers_nan_list()} | {:error, term}
  @doc "Vector Arithmetic Add"
  def add(high, low) do
    with {:ok, %{high: high, low: low}} <- load_lists([high: high, low: low], [:high, :low]),
         {:ok, [result]} <- Nif.nif_add(high, low) do
      {:ok, result}
    else
      error ->
        error
    end
  end

  @spec adosc(hlcv(), [{:fast_period, pos_integer} | {:slow_period, pos_integer}]) ::
          {:ok, numbers_nan_list()} | {:error, term}
  @doc "Chaikin A/D Oscillator"
  def adosc(opts, other_params) do
    with {:fast_period, fast_period}
         when int_2_to_100000(fast_period) <-
           {:fast_period, Keyword.get(other_params, :fast_period)},
         {:slow_period, slow_period}
         when int_2_to_100000(slow_period) <-
           {:slow_period, Keyword.get(other_params, :slow_period)},
         {:ok, %{high: high, low: low, close: close, volume: volume}} <- hlcv(opts),
         {:ok, [result]} <- Nif.nif_adosc(high, low, close, volume, fast_period, slow_period) do
      {:ok, result}
    else
      {option, _} ->
        {:error, "#{option} is required and should be between 2 and 100,000"}

      error ->
        error
    end
  end

  @spec adx(hlc(), [{:window, pos_integer()}]) :: {:ok, numbers_nan_list()} | {:error, term}
  @doc "Average Directional Movement Index"
  def adx(opts, other_params) do
    with {:window, window}
         when int_2_to_100000(window) <-
           {:window, Keyword.get(other_params, :window)},
         {:ok, %{high: high, low: low, close: close}} <- hlc(opts),
         {:ok, [result]} <- Nif.nif_adx(high, low, close, window) do
      {:ok, result}
    else
      {option, _} ->
        {:error, "#{option} is required and should be between 2 and 100,000"}

      error ->
        error
    end
  end

  @spec adxr(hlc(), [{:window, pos_integer()}]) :: {:ok, numbers_nan_list()} | {:error, term}
  @doc "Average Directional Movement Index Rating"
  def adxr(opts, other_params) do
    with {:window, window}
         when int_2_to_100000(window) <-
           {:window, Keyword.get(other_params, :window)},
         {:ok, %{high: high, low: low, close: close}} <- hlc(opts),
         {:ok, [result]} <- Nif.nif_adxr(high, low, close, window) do
      {:ok, result}
    else
      {option, _} ->
        {:error, "#{option} is required and should be between 2 and 100,000"}

      error ->
        error
    end
  end

  @moving_average_types ~w(sma ema wma dema tema trima kama mama t3)a

  @spec apo(list_of_numbers, [
          {:fast_period, pos_integer()},
          {:slow_period, pos_integer()},
          {:moving_average_type,
           :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
        ]) :: {:ok, numbers_nan_list()} | {:error, term}
  @doc "Absolute Price Oscillator"
  def apo(list, other_params) do
    with {:fast_period, fast_period}
         when int_2_to_100000(fast_period) <-
           {:fast_period, Keyword.get(other_params, :fast_period)},
         {:slow_period, slow_period}
         when int_2_to_100000(slow_period) <-
           {:slow_period, Keyword.get(other_params, :slow_period)},
         {:moving_average_type, moving_average_type}
         when moving_average_type in @moving_average_types <-
           {:moving_average_type, Keyword.get(other_params, :moving_average_type)},
         {:ok, %{list: list}} <- load_lists([list: list], [:list]),
         {:ok, [result]} <-
           Nif.nif_apo(
             list,
             fast_period,
             slow_period,
             Enum.find_index(@moving_average_types, &(&1 == moving_average_type))
           ) do
      {:ok, result}
    else
      {:moving_average_type, _} ->
        {:error,
         "moving_average_type is required and should be one of #{Enum.join(@moving_average_types, ", ")}"}

      {option, _} ->
        {:error, "#{option} is required and should be between 2 and 100,000"}

      error ->
        error
    end
  end

  @spec aroon([{:high, list_of_numbers} | {:low, list_of_numbers} | {:window, pos_integer()}]) ::
          {:ok, down :: numbers_nan_list(), up :: numbers_nan_list()} | {:error, term}
  @doc "Aroon"
  def aroon(opts) do
    with {:window, window} when int_2_to_100000(window) <- {:window, Keyword.get(opts, :window)},
         {:ok, %{high: high, low: low}} <- load_lists(opts, [:high, :low]),
         {:ok, [down, up]} <- Nif.nif_aroon(high, low, window) do
      {:ok, down, up}
    else
      {option, _} ->
        {:error, "#{option} is required and should be between 2 and 100,000"}

      error ->
        error
    end
  end

  @spec aroonosc([{:high, list_of_numbers} | {:low, list_of_numbers} | {:window, pos_integer()}]) ::
          {:ok, down :: numbers_nan_list(), up :: numbers_nan_list()} | {:error, term}
  @doc "Aroon Oscillator"
  def aroonosc(opts) do
    with {:window, window} when int_2_to_100000(window) <- {:window, Keyword.get(opts, :window)},
         {:ok, %{high: high, low: low}} <- load_lists(opts, [:high, :low]),
         {:ok, [result]} <- Nif.nif_aroonosc(high, low, window) do
      {:ok, result}
    else
      {option, _} ->
        {:error, "#{option} is required and should be between 2 and 100,000"}

      error ->
        error
    end
  end

  @spec asin(list_of_numbers) ::
          {:ok, numbers_nan_list} | {:error, term}
  @doc "Vector Trigonometric ASin"
  def asin(list) do
    with {:ok, %{list: list}} <- load_lists([list: list], [:list]),
         {:ok, [result]} <- Nif.nif_asin(list) do
      {:ok, result}
    else
      error ->
        error
    end
  end

  @spec sma(list_of_numbers, [{:window, pos_integer()}]) ::
          {:ok, numbers_nan_list} | {:error, term}
  @doc """
  Simple Moving Average
  """
  def sma(list, opts \\ []) do
    with {:ok, %{list: list}} <- load_lists([list: list], [:list]),
         {:window, window} when is_integer(window) and window > 0 and window < 100_000 <-
           Keyword.get(opts, :window),
         {:ok, [result]} <- Nif.nif_sma(list, window) do
      {:ok, result}
    else
      {:window, _} ->
        {:error, "window is required"}

      error ->
        error
    end
  end

  @spec sqrt(list_of_numbers) ::
          {:ok, numbers_nan_list} | {:error, term}
  @doc "Vector Square Root"
  def sqrt(list) do
    with {:ok, %{list: list}} <- load_lists([list: list], [:list]),
         {:ok, [result]} <- Nif.nif_sqrt(list) do
      {:ok, result}
    else
      error ->
        error
    end
  end

  defp load_lists(opts, fields) when is_map(opts), do: opts |> Map.to_list() |> load_lists(fields)

  defp load_lists(opts, fields) when is_list(opts) do
    with {:ok, result} <-
           Enum.reduce_while(fields, {:ok, %{}}, fn field, {:ok, result} ->
             case get_list(opts, field) do
               list when is_list(list) ->
                 result = Map.merge(result, %{field => list, "#{field}_length" => length(list)})
                 {:cont, {:ok, result}}

               _ ->
                 {:halt, {:error, {:missing, field}}}
             end
           end),
         {lengths, result} <- Map.split(result, Enum.map(fields, &"#{&1}_length")),
         [_] <- lengths |> Map.values() |> Enum.uniq() do
      {:ok, result}
    else
      {:error, {:missing, field}} ->
        {:error, "expected (#{Enum.join(fields, ", ")}) missing #{field}"}

      [_ | _] ->
        {:error, :all_lists_should_have_same_length}

      {:error, error} ->
        {:error, error}
    end
  end

  defp hlc(opts), do: load_lists(opts, [:close, :high, :low])
  defp hlcv(opts), do: load_lists(opts, [:volume, :close, :high, :low])
  defp ohlc(opts), do: load_lists(opts, [:open, :close, :high, :low])
  defp ohlcv(opts), do: load_lists(opts, [:volume, :open, :close, :high, :low])

  defp get_list(opts, field) do
    case Keyword.get(opts, field) do
      %Range{} = range -> Enum.to_list(range)
      list -> list
    end
  end

  def opts do
    [
      open: [
        76.09,
        76.14,
        76.75,
        77.1,
        77.26,
        78.28,
        77.69,
        78.06,
        78.09,
        78.72,
        78.02,
        78.49,
        79.56,
        79.47,
        79.32,
        79,
        78.88,
        78.88,
        78.74,
        78.25,
        78.89,
        79.13,
        79.55,
        78.72,
        78.7,
        78.74,
        77.4,
        77.8,
        78.41,
        78.74,
        79.73,
        79.83,
        80
      ],
      high: [
        76.44,
        76.84,
        77.06,
        77.34,
        77.96,
        78.32,
        78.11,
        78.25,
        78.14,
        78.72,
        78.47,
        79.47,
        79.69,
        79.54,
        79.41,
        79.25,
        79,
        79.36,
        79.21,
        79.09,
        79.72,
        79.76,
        79.72,
        79.51,
        79.35,
        78.81,
        77.44,
        78.79,
        79.29,
        79.79,
        80.11,
        80.42,
        80.87
      ],
      low: [
        75.54,
        75.93,
        76.73,
        76.05,
        77.23,
        77.92,
        77.59,
        77.85,
        77.64,
        77.67,
        77.98,
        78.33,
        79.36,
        78.95,
        78.46,
        78.57,
        78.4,
        78.85,
        78.59,
        78,
        78.85,
        79.06,
        78.3,
        78.65,
        78.67,
        77.19,
        76.35,
        77.79,
        78.4,
        78.68,
        79.38,
        79.79,
        79.95
      ],
      close: [
        75.9,
        76.71,
        76.84,
        76.93,
        77.83,
        78.21,
        78.06,
        78.01,
        78.06,
        77.85,
        78.37,
        79.31,
        79.5,
        78.98,
        78.83,
        78.83,
        78.56,
        79.17,
        79.07,
        78.88,
        79.68,
        79.65,
        78.72,
        79.4,
        78.74,
        77.22,
        76.98,
        78.61,
        79.23,
        79.79,
        79.48,
        80.38,
        80.84
      ],
      volume: [
        27_209_900,
        27_118_600,
        17_809_700,
        27_715_100,
        25_141_500,
        27_604_400,
        28_132_900,
        18_310_700,
        16_763_000,
        25_704_300,
        27_174_300,
        31_645_300,
        26_280_900,
        26_181_500,
        30_305_000,
        21_871_300,
        22_723_600,
        22_406_900,
        24_896_000,
        27_997_900,
        33_024_100,
        25_466_800,
        42_970_800,
        22_852_700,
        20_227_100,
        43_494_500,
        64_489_900,
        47_812_400,
        25_214_100,
        31_438_600,
        38_446_600,
        46_661_000,
        31_916_600
      ]
    ]
  end
end
