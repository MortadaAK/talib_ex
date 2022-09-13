defmodule TalibEx.Nif do
  @moduledoc """
  Documentation for `TalibEx`.
  """
  @on_load :load_nifs

  def load_nifs do
    :talib_ex
    |> :code.priv_dir()
    |> Path.join("talib")
    |> :erlang.load_nif(0)
  end

  def nif_acos(_) do
    raise "nif_acos/1 not implemented end"
  end

  def nif_ad(_, _, _, _) do
    raise "nif_ad/4 not implemented end"
  end

  def nif_add(_, _) do
    raise "nif_add/2 not implemented end"
  end

  def nif_adosc(_, _, _, _, _, _) do
    raise "nif_adosc/6 not implemented end"
  end

  def nif_adx(_, _, _, _) do
    raise "nif_adx/4 not implemented end"
  end

  def nif_adxr(_, _, _, _) do
    raise "nif_adxr/4 not implemented end"
  end

  def nif_apo(_, _, _, _) do
    raise "nif_apo/4 not implemented end"
  end

  def nif_aroon(_, _, _) do
    raise "nif_aroon/3 not implemented end"
  end

  def nif_sma(_, _) do
    raise "nif_sma/2 not implemented end"
  end

  def nif_sqrt(_) do
    raise "nif_sqrt/1 not implemented end"
  end
end
  