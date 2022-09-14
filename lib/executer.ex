defmodule TalibEx.Executer do
  @moduledoc false
  defstruct [
    :params,
    args: [],
    valid?: true,
    error_message: nil
  ]

  def new(params), do: %__MODULE__{params: Map.new(params)}
  def load(token, name, type, opts \\ %{})
  def load(%__MODULE__{valid?: false} = token, _name, _type, _opts), do: token

  def load(%__MODULE__{params: params} = token, name, :double_array, %{default: default}) do
    case Map.get(params, name, default) do
      [_ | _] = list -> %{token | args: [list | token.args]}
      [] -> add_error(token, "#{name} is an empty list")
      nil -> add_error(token, required(name))
      _ -> add_error(token, type(name, :list))
    end
  end

  def load(%__MODULE__{params: params} = token, name, :integer, %{default: default} = opts) do
    %{min: min, max: max} =
      opts
      |> Map.put_new(:min, nil)
      |> Map.put_new(:max, nil)

    case Map.get(params, name, default) do
      nil ->
        add_error(token, required(name))

      integer
      when is_integer(integer) and
             (is_nil(min) or integer >= min) and
             (is_nil(max) or integer <= max) ->
        %{token | args: [integer | token.args]}

      integer
      when is_integer(integer) and is_number(min) and integer < min ->
        add_error(token, "#{name} should be grater than #{min}")

      integer
      when is_integer(integer) and is_number(max) and integer > max ->
        add_error(token, "#{name} should be less than #{min}")

      _ ->
        add_error(token, type(name, :integer))
    end
  end

  def load(%__MODULE__{params: params} = token, name, :double, %{default: default} = opts) do
    %{min: min, max: max} =
      opts
      |> Map.put_new(:min, nil)
      |> Map.put_new(:max, nil)

    case Map.get(params, name, default) do
      nil ->
        add_error(token, required(name))

      number
      when is_number(number) and
             (is_nil(min) or number >= min) and
             (is_nil(max) or number <= max) ->
        %{token | args: [number | token.args]}

      number
      when is_number(number) and is_number(min) and number < min ->
        add_error(token, "#{name} should be grater than #{min}")

      number
      when is_number(number) and is_number(max) and number > max ->
        add_error(token, "#{name} should be less than #{min}")

      _ ->
        add_error(token, type(name, :number))
    end
  end

  def load(%__MODULE__{params: params} = token, name, :ma_type, %{default: default}) do
    case Map.get(params, name, default) do
      value when value in ~w(sma ema wma dema tema trima kama mama t3)a ->
        %{token | args: [value | token.args]}

      _ ->
        add_error(token, required(name))
    end
  end

  def load(%__MODULE__{} = token, name, type, opts),
    do: load(token, name, type, Map.put(opts, :default, nil))

  def call(%__MODULE__{valid?: false, error_message: message}, _function), do: {:error, message}

  def call(%__MODULE__{args: args}, function) do
    args = Enum.reverse(args)

    case apply(function, args) do
      {:error, message} -> {:error, List.to_string(message)}
      result -> result
    end
  end

  defp type(name, type), do: "#{name} should be a #{type}"
  defp required(name), do: "#{name} is required"
  defp add_error(token, message), do: %{token | error_message: message, valid?: false}
end
