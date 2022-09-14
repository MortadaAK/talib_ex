defmodule TalibEx.Nif do
  @moduledoc false
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

  def nif_aroonosc(_, _, _) do
    raise "nif_aroonosc/3 not implemented end"
  end

  def nif_asin(_) do
    raise "nif_asin/1 not implemented end"
  end

  def nif_atan(_) do
    raise "nif_atan/1 not implemented end"
  end

  def nif_atr(_, _, _, _) do
    raise "nif_atr/4 not implemented end"
  end

  def nif_avgprice(_, _, _, _) do
    raise "nif_avgprice/4 not implemented end"
  end

  def nif_bbands(_, _, _, _, _) do
    raise "nif_bbands/5 not implemented end"
  end

  def nif_beta(_, _, _) do
    raise "nif_beta/3 not implemented end"
  end

  def nif_bop(_, _, _, _) do
    raise "nif_bop/4 not implemented end"
  end

  def nif_cci(_, _, _, _) do
    raise "nif_cci/4 not implemented end"
  end

  def nif_sma(_, _) do
    raise "nif_sma/2 not implemented end"
  end

  def nif_sqrt(_) do
    raise "nif_sqrt/1 not implemented end"
  end
end