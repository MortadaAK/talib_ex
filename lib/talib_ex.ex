defmodule TalibEx do
  @moduledoc """
  Documentation for `TalibEx`.
  """
  alias TalibEx.Nif
  @type numbers_nan_list :: [:nan | number()]
  @type list_of_numbers :: [number()] | Range.t()
  @type open :: {:open, list_of_numbers()}
  @type high :: {:high, list_of_numbers()}
  @type low :: {:low, list_of_numbers()}
  @type close :: {:close, list_of_numbers()}
  @type volume :: {:volume, list_of_numbers()}
  @type fast_period :: {:fast_period, pos_integer}
  @type slow_period :: {:slow_period, pos_integer}
  @type window :: {:window, pos_integer}
  @type moving_average_type ::
          {:moving_average_type,
           :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}
  @moving_average_types ~w(sma ema wma dema tema trima kama mama t3)a

  @spec acos(list_of_numbers) ::
          {:ok, numbers_nan_list} | {:error, term}

  defguardp int_2_to_100000(value) when is_integer(value) and value >= 2 and value <= 100_000
  @numeric_message "is required and should be between 2 and 100,000"
  @doc "Vector Trigonometric ACos"
  def acos(list) do
    with {:ok, %{list: list}} <- load_lists([list: list], [:list]),
         {:ok, [result]} <- Nif.nif_acos(list) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec ad([volume() | low() | high() | close()]) ::
          {:ok, numbers_nan_list} | {:error, term}
  @doc "Chaikin A/D Line"
  def ad(opts) do
    with {:ok, %{volume: volume, low: low, high: high, close: close}} <- hlcv(opts),
         {:ok, [result]} <- Nif.nif_ad(high, low, close, volume) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec add(list_of_numbers(), list_of_numbers()) :: {:ok, numbers_nan_list()} | {:error, term}
  @doc "Vector Arithmetic Add"
  def add(high, low) do
    with {:ok, %{high: high, low: low}} <- load_lists([high: high, low: low], [:high, :low]),
         {:ok, [result]} <- Nif.nif_add(high, low) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec adosc([fast_period() | slow_period() | high() | low() | close() | volume()]) ::
          {:ok, numbers_nan_list()} | {:error, term}
  @doc "Chaikin A/D Oscillator"
  def adosc(opts) do
    with {:fast_period, fast_period} when int_2_to_100000(fast_period) <-
           {:fast_period, Keyword.get(opts, :fast_period)},
         {:slow_period, slow_period} when int_2_to_100000(slow_period) <-
           {:slow_period, Keyword.get(opts, :slow_period)},
         {:ok, %{high: high, low: low, close: close, volume: volume}} <- hlcv(opts),
         {:ok, [result]} <- Nif.nif_adosc(high, low, close, volume, fast_period, slow_period) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec adx([high() | low() | close() | window()]) :: {:ok, numbers_nan_list()} | {:error, term}
  @doc "Average Directional Movement Index"
  def adx(opts) do
    with {:window, window} when int_2_to_100000(window) <- {:window, Keyword.get(opts, :window)},
         {:ok, %{high: high, low: low, close: close}} <- hlc(opts),
         {:ok, [result]} <- Nif.nif_adx(high, low, close, window) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec adxr([window() | low() | high() | close()]) :: {:ok, numbers_nan_list()} | {:error, term}
  @doc "Average Directional Movement Index Rating"
  def adxr(opts) do
    with {:window, window} when int_2_to_100000(window) <- {:window, Keyword.get(opts, :window)},
         {:ok, %{high: high, low: low, close: close}} <- hlc(opts),
         {:ok, [result]} <- Nif.nif_adxr(high, low, close, window) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec apo(list_of_numbers, [
          fast_period()
          | slow_period()
          | moving_average_type()
        ]) :: {:ok, numbers_nan_list()} | {:error, term}
  @doc "Absolute Price Oscillator"
  def apo(list, other_params) do
    with {:fast_period, fast_period} when int_2_to_100000(fast_period) <-
           {:fast_period, Keyword.get(other_params, :fast_period)},
         {:slow_period, slow_period} when int_2_to_100000(slow_period) <-
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
             resolve_moving_average_type(moving_average_type)
           ) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec aroon([high() | low() | window()]) ::
          {:ok, down :: numbers_nan_list(), up :: numbers_nan_list()} | {:error, term}
  @doc "Aroon"
  def aroon(opts) do
    with {:window, window} when int_2_to_100000(window) <- {:window, Keyword.get(opts, :window)},
         {:ok, %{high: high, low: low}} <- load_lists(opts, [:high, :low]),
         {:ok, [down, up]} <- Nif.nif_aroon(high, low, window) do
      {:ok, down, up}
    else
      error -> handle_error(error)
    end
  end

  @spec aroonosc([high() | low() | window()]) ::
          {:ok, down :: numbers_nan_list(), up :: numbers_nan_list()} | {:error, term}
  @doc "Aroon Oscillator"
  def aroonosc(opts) do
    with {:window, window} when int_2_to_100000(window) <- {:window, Keyword.get(opts, :window)},
         {:ok, %{high: high, low: low}} <- load_lists(opts, [:high, :low]),
         {:ok, [result]} <- Nif.nif_aroonosc(high, low, window) do
      {:ok, result}
    else
      error -> handle_error(error)
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
      error -> handle_error(error)
    end
  end

  @spec atan(list_of_numbers) ::
          {:ok, numbers_nan_list} | {:error, term}
  @doc "Vector Trigonometric ATan"
  def atan(list) do
    with {:ok, %{list: list}} <- load_lists([list: list], [:list]),
         {:ok, [result]} <- Nif.nif_atan(list) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec atr([high() | low() | close() | window()]) ::
          {:ok, numbers_nan_list()} | {:error, term}
  @doc "Average True Range"
  def atr(opts) do
    with {:window, window} when int_2_to_100000(window) <- {:window, Keyword.get(opts, :window)},
         {:ok, %{high: high, low: low, close: close}} <- hlc(opts),
         {:ok, [result]} <- Nif.nif_atr(high, low, close, window) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec avgprice([high() | low() | close() | open()]) ::
          {:ok, numbers_nan_list()} | {:error, term}
  @doc "Average Price"
  def avgprice(opts) do
    with {:ok, %{high: high, low: low, close: close, open: open}} <- ohlc(opts),
         {:ok, [result]} <- Nif.nif_avgprice(open, high, low, close) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec bbands(list_of_numbers(), [
          window() | {:np_dev_up, number()} | {:np_dev_down, number()} | moving_average_type()
        ]) ::
          {:ok, upper :: numbers_nan_list(), middle :: numbers_nan_list(),
           lower :: numbers_nan_list()}
          | {:error, term}
  @doc "Bollinger Bands"
  def bbands(list, opts) do
    with {:window, window} when int_2_to_100000(window) <- {:window, Keyword.get(opts, :window)},
         {:np_dev_up, np_dev_up} when is_number(np_dev_up) <-
           {:np_dev_up, Keyword.get(opts, :np_dev_up)},
         {:np_dev_down, np_dev_down} when is_number(np_dev_down) <-
           {:np_dev_down, Keyword.get(opts, :np_dev_down)},
         {:moving_average_type, moving_average_type}
         when moving_average_type in @moving_average_types <-
           {:moving_average_type, Keyword.get(opts, :moving_average_type)},
         {:ok, %{list: list}} <- load_lists([list: list], [:list]),
         {:ok, [upper, middle, lower]} <-
           Nif.nif_bbands(
             list,
             window,
             np_dev_up,
             np_dev_down,
             resolve_moving_average_type(moving_average_type)
           ) do
      {:ok, upper, middle, lower}
    else
      error -> handle_error(error)
    end
  end

  @spec beta(list_of_numbers(), list_of_numbers(), [window()]) ::
          {:ok, numbers_nan_list} | {:error, term}
  @doc """
  Beta
  """
  def beta(list1, list2, opts) do
    with {:ok, %{list1: list1, list2: list2}} <-
           load_lists([list1: list1, list2: list2], [:list1, :list2]),
         {:window, window} when int_2_to_100000(window) <- {:window, Keyword.get(opts, :window)},
         {:ok, [result]} <- Nif.nif_beta(list1, list2, window) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec bop([high() | low() | close() | open()]) ::
          {:ok, numbers_nan_list()} | {:error, term}
  @doc "Balance Of Power"
  def bop(opts) do
    with {:ok, %{high: high, low: low, close: close, open: open}} <- ohlc(opts),
         {:ok, [result]} <- Nif.nif_bop(open, high, low, close) do
      {:ok, result}
    else
      error -> handle_error(error)
    end
  end

  @spec sma(list_of_numbers, [window()]) ::
          {:ok, numbers_nan_list} | {:error, term}
  @doc """
  Simple Moving Average
  """
  def sma(list, opts \\ []) do
    with {:ok, %{list: list}} <- load_lists([list: list], [:list]),
         {:window, window} when int_2_to_100000(window) <-
           {:window, Keyword.get(opts, :window, 5)},
         {:ok, [result]} <- Nif.nif_sma(list, window) do
      {:ok, result}
    else
      error -> handle_error(error)
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
      error -> handle_error(error)
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

  defp resolve_moving_average_type(type),
    do: Enum.find_index(@moving_average_types, &(&1 == type))

  defp handle_error({:moving_average_type, _}),
    do:
      {:error,
       "moving_average_type is required and should be one of #{Enum.join(@moving_average_types, ", ")}"}

  defp handle_error({:error, error}) when is_list(error),
    do: {:error, List.to_string(error)}

  defp handle_error({:error, error}), do: {:error, error}

  defp handle_error({option, _}) when is_atom(option) and option not in [:ok, :error],
    do: {:error, "#{option} #{@numeric_message}"}

  defp handle_error(error), do: error
end
