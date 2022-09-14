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

  def nif_cdl2_crows(_, _, _, _) do
    raise "nif_cdl2_crows/4 not implemented end"
  end

  def nif_cdl3_black_crows(_, _, _, _) do
    raise "nif_cdl3_black_crows/4 not implemented end"
  end

  def nif_cdl3_inside(_, _, _, _) do
    raise "nif_cdl3_inside/4 not implemented end"
  end

  def nif_cdl3_line_strike(_, _, _, _) do
    raise "nif_cdl3_line_strike/4 not implemented end"
  end

  def nif_cdl3_outside(_, _, _, _) do
    raise "nif_cdl3_outside/4 not implemented end"
  end

  def nif_cdl3_stars_in_south(_, _, _, _) do
    raise "nif_cdl3_stars_in_south/4 not implemented end"
  end

  def nif_cdl3_white_soldiers(_, _, _, _) do
    raise "nif_cdl3_white_soldiers/4 not implemented end"
  end

  def nif_cdl_abandoned_baby(_, _, _, _, _) do
    raise "nif_cdl_abandoned_baby/5 not implemented end"
  end

  def nif_cdl_advance_block(_, _, _, _) do
    raise "nif_cdl_advance_block/4 not implemented end"
  end

  def nif_cdl_belt_hold(_, _, _, _) do
    raise "nif_cdl_belt_hold/4 not implemented end"
  end

  def nif_cdl_breakaway(_, _, _, _) do
    raise "nif_cdl_breakaway/4 not implemented end"
  end

  def nif_cdl_closing_marubozu(_, _, _, _) do
    raise "nif_cdl_closing_marubozu/4 not implemented end"
  end

  def nif_cdl_conceal_baby_swallow(_, _, _, _) do
    raise "nif_cdl_conceal_baby_swallow/4 not implemented end"
  end

  def nif_cdl_counterattack(_, _, _, _) do
    raise "nif_cdl_counterattack/4 not implemented end"
  end

  def nif_cdl_dark_cloud_cover(_, _, _, _, _) do
    raise "nif_cdl_dark_cloud_cover/5 not implemented end"
  end

  def nif_cdl_doji(_, _, _, _) do
    raise "nif_cdl_doji/4 not implemented end"
  end

  def nif_cdl_doji_star(_, _, _, _) do
    raise "nif_cdl_doji_star/4 not implemented end"
  end

  def nif_cdl_dragonfly_doji(_, _, _, _) do
    raise "nif_cdl_dragonfly_doji/4 not implemented end"
  end

  def nif_cdl_engulfing(_, _, _, _) do
    raise "nif_cdl_engulfing/4 not implemented end"
  end

  def nif_cdl_evening_doji_star(_, _, _, _, _) do
    raise "nif_cdl_evening_doji_star/5 not implemented end"
  end

  def nif_cdl_evening_star(_, _, _, _, _) do
    raise "nif_cdl_evening_star/5 not implemented end"
  end

  def nif_cdl_gap_side_side_white(_, _, _, _) do
    raise "nif_cdl_gap_side_side_white/4 not implemented end"
  end

  def nif_cdl_gravestone_doji(_, _, _, _) do
    raise "nif_cdl_gravestone_doji/4 not implemented end"
  end

  def nif_cdl_hammer(_, _, _, _) do
    raise "nif_cdl_hammer/4 not implemented end"
  end

  def nif_cdl_hanging_man(_, _, _, _) do
    raise "nif_cdl_hanging_man/4 not implemented end"
  end

  def nif_cdl_harami(_, _, _, _) do
    raise "nif_cdl_harami/4 not implemented end"
  end

  def nif_cdl_harami_cross(_, _, _, _) do
    raise "nif_cdl_harami_cross/4 not implemented end"
  end

  def nif_cdl_highwave(_, _, _, _) do
    raise "nif_cdl_highwave/4 not implemented end"
  end

  def nif_cdl_hikkake(_, _, _, _) do
    raise "nif_cdl_hikkake/4 not implemented end"
  end

  def nif_cdl_hikkake_mod(_, _, _, _) do
    raise "nif_cdl_hikkake_mod/4 not implemented end"
  end

  def nif_cdl_homing_pigeon(_, _, _, _) do
    raise "nif_cdl_homing_pigeon/4 not implemented end"
  end

  def nif_cdl_identical_3_crows(_, _, _, _) do
    raise "nif_cdl_identical_3_crows/4 not implemented end"
  end

  def nif_cdl_inneck(_, _, _, _) do
    raise "nif_cdl_inneck/4 not implemented end"
  end

  def nif_cdl_inverted_hammer(_, _, _, _) do
    raise "nif_cdl_inverted_hammer/4 not implemented end"
  end

  def nif_cdl_kicking(_, _, _, _) do
    raise "nif_cdl_kicking/4 not implemented end"
  end

  def nif_cdl_kicking_by_length(_, _, _, _) do
    raise "nif_cdl_kicking_by_length/4 not implemented end"
  end

  def nif_cdl_ladder_bottom(_, _, _, _) do
    raise "nif_cdl_ladder_bottom/4 not implemented end"
  end

  def nif_cdl_long_legged_doji(_, _, _, _) do
    raise "nif_cdl_long_legged_doji/4 not implemented end"
  end

  def nif_cdl_long_line(_, _, _, _) do
    raise "nif_cdl_long_line/4 not implemented end"
  end

  def nif_cdl_marubozu(_, _, _, _) do
    raise "nif_cdl_marubozu/4 not implemented end"
  end

  def nif_cdl_matching_low(_, _, _, _) do
    raise "nif_cdl_matching_low/4 not implemented end"
  end

  def nif_cdl_mat_hold(_, _, _, _, _) do
    raise "nif_cdl_mat_hold/5 not implemented end"
  end

  def nif_cdl_morning_doji_star(_, _, _, _, _) do
    raise "nif_cdl_morning_doji_star/5 not implemented end"
  end

  def nif_cdl_morning_star(_, _, _, _, _) do
    raise "nif_cdl_morning_star/5 not implemented end"
  end

  def nif_cdl_on_neck(_, _, _, _) do
    raise "nif_cdl_on_neck/4 not implemented end"
  end

  def nif_cdl_piercing(_, _, _, _) do
    raise "nif_cdl_piercing/4 not implemented end"
  end

  def nif_cdl_rickshaw_man(_, _, _, _) do
    raise "nif_cdl_rickshaw_man/4 not implemented end"
  end

  def nif_cdl_rise_fall_3_methods(_, _, _, _) do
    raise "nif_cdl_rise_fall_3_methods/4 not implemented end"
  end

  def nif_cdl_separating_lines(_, _, _, _) do
    raise "nif_cdl_separating_lines/4 not implemented end"
  end

  def nif_cdl_shooting_star(_, _, _, _) do
    raise "nif_cdl_shooting_star/4 not implemented end"
  end

  def nif_cdl_short_line(_, _, _, _) do
    raise "nif_cdl_short_line/4 not implemented end"
  end

  def nif_cdl_spinning_top(_, _, _, _) do
    raise "nif_cdl_spinning_top/4 not implemented end"
  end

  def nif_cdl_stalled_pattern(_, _, _, _) do
    raise "nif_cdl_stalled_pattern/4 not implemented end"
  end

  def nif_cdl_stick_sandwich(_, _, _, _) do
    raise "nif_cdl_stick_sandwich/4 not implemented end"
  end

  def nif_cdl_takuri(_, _, _, _) do
    raise "nif_cdl_takuri/4 not implemented end"
  end

  def nif_cdl_tasuki_gap(_, _, _, _) do
    raise "nif_cdl_tasuki_gap/4 not implemented end"
  end

  def nif_cdl_thrusting(_, _, _, _) do
    raise "nif_cdl_thrusting/4 not implemented end"
  end

  def nif_cdl_tri_star(_, _, _, _) do
    raise "nif_cdl_tri_star/4 not implemented end"
  end

  def nif_cdl_unique_3_river(_, _, _, _) do
    raise "nif_cdl_unique_3_river/4 not implemented end"
  end

  def nif_cdl_upside_gap_2_crows(_, _, _, _) do
    raise "nif_cdl_upside_gap_2_crows/4 not implemented end"
  end

  def nif_cdl_upside_downside_gap_3_methods(_, _, _, _) do
    raise "nif_cdl_upside_downside_gap_3_methods/4 not implemented end"
  end

  def nif_sma(_, _) do
    raise "nif_sma/2 not implemented end"
  end

  def nif_sqrt(_) do
    raise "nif_sqrt/1 not implemented end"
  end
end