defmodule TalibEx.Nif do
  @moduledoc false
  # Generated File

  @on_load :load_nifs

  def load_nifs do
    :talib_ex_nif
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

  def nif_ceil(_) do
    raise "nif_ceil/1 not implemented end"
  end

  def nif_cmo(_, _) do
    raise "nif_cmo/2 not implemented end"
  end

  def nif_correl(_, _, _) do
    raise "nif_correl/3 not implemented end"
  end

  def nif_cos(_) do
    raise "nif_cos/1 not implemented end"
  end

  def nif_cosh(_) do
    raise "nif_cosh/1 not implemented end"
  end

  def nif_dema(_, _) do
    raise "nif_dema/2 not implemented end"
  end

  def nif_div(_, _) do
    raise "nif_div/2 not implemented end"
  end

  def nif_dx(_, _, _, _) do
    raise "nif_dx/4 not implemented end"
  end

  def nif_ema(_, _) do
    raise "nif_ema/2 not implemented end"
  end

  def nif_exp(_) do
    raise "nif_exp/1 not implemented end"
  end

  def nif_floor(_) do
    raise "nif_floor/1 not implemented end"
  end

  def nif_ht_dcperiod(_) do
    raise "nif_ht_dcperiod/1 not implemented end"
  end

  def nif_ht_dcphase(_) do
    raise "nif_ht_dcphase/1 not implemented end"
  end

  def nif_ht_phasor(_) do
    raise "nif_ht_phasor/1 not implemented end"
  end

  def nif_ht_sine(_) do
    raise "nif_ht_sine/1 not implemented end"
  end

  def nif_ht_trendline(_) do
    raise "nif_ht_trendline/1 not implemented end"
  end

  def nif_ht_trendmode(_) do
    raise "nif_ht_trendmode/1 not implemented end"
  end

  def nif_kama(_, _) do
    raise "nif_kama/2 not implemented end"
  end

  def nif_linear_reg(_, _) do
    raise "nif_linear_reg/2 not implemented end"
  end

  def nif_linear_reg_angle(_, _) do
    raise "nif_linear_reg_angle/2 not implemented end"
  end

  def nif_linear_reg_intercept(_, _) do
    raise "nif_linear_reg_intercept/2 not implemented end"
  end

  def nif_linear_reg_slope(_, _) do
    raise "nif_linear_reg_slope/2 not implemented end"
  end

  def nif_ln(_) do
    raise "nif_ln/1 not implemented end"
  end

  def nif_log10(_) do
    raise "nif_log10/1 not implemented end"
  end

  def nif_ma(_, _, _) do
    raise "nif_ma/3 not implemented end"
  end

  def nif_macd(_, _, _, _) do
    raise "nif_macd/4 not implemented end"
  end

  def nif_macdext(_, _, _, _, _, _, _) do
    raise "nif_macdext/7 not implemented end"
  end

  def nif_macdfix(_, _) do
    raise "nif_macdfix/2 not implemented end"
  end

  def nif_mama(_, _, _) do
    raise "nif_mama/3 not implemented end"
  end

  def nif_mavp(_, _, _, _, _) do
    raise "nif_mavp/5 not implemented end"
  end

  def nif_max(_, _) do
    raise "nif_max/2 not implemented end"
  end

  def nif_max_index(_, _) do
    raise "nif_max_index/2 not implemented end"
  end

  def nif_med_price(_, _) do
    raise "nif_med_price/2 not implemented end"
  end

  def nif_mfi(_, _, _, _, _) do
    raise "nif_mfi/5 not implemented end"
  end

  def nif_mid_point(_, _) do
    raise "nif_mid_point/2 not implemented end"
  end

  def nif_mid_price(_, _, _) do
    raise "nif_mid_price/3 not implemented end"
  end

  def nif_min(_, _) do
    raise "nif_min/2 not implemented end"
  end

  def nif_min_index(_, _) do
    raise "nif_min_index/2 not implemented end"
  end

  def nif_min_max(_, _) do
    raise "nif_min_max/2 not implemented end"
  end

  def nif_min_max_index(_, _) do
    raise "nif_min_max_index/2 not implemented end"
  end

  def nif_minus_di(_, _, _, _) do
    raise "nif_minus_di/4 not implemented end"
  end

  def nif_minus_dm(_, _, _) do
    raise "nif_minus_dm/3 not implemented end"
  end

  def nif_mom(_, _) do
    raise "nif_mom/2 not implemented end"
  end

  def nif_mult(_, _) do
    raise "nif_mult/2 not implemented end"
  end

  def nif_natr(_, _, _, _) do
    raise "nif_natr/4 not implemented end"
  end

  def nif_obv(_, _) do
    raise "nif_obv/2 not implemented end"
  end

  def nif_plus_di(_, _, _, _) do
    raise "nif_plus_di/4 not implemented end"
  end

  def nif_plus_dm(_, _, _) do
    raise "nif_plus_dm/3 not implemented end"
  end

  def nif_ppo(_, _, _, _) do
    raise "nif_ppo/4 not implemented end"
  end

  def nif_roc(_, _) do
    raise "nif_roc/2 not implemented end"
  end

  def nif_rocp(_, _) do
    raise "nif_rocp/2 not implemented end"
  end

  def nif_rocr(_, _) do
    raise "nif_rocr/2 not implemented end"
  end

  def nif_rocr100(_, _) do
    raise "nif_rocr100/2 not implemented end"
  end

  def nif_rsi(_, _) do
    raise "nif_rsi/2 not implemented end"
  end

  def nif_sar(_, _, _, _) do
    raise "nif_sar/4 not implemented end"
  end

  def nif_sarext(_, _, _, _, _, _, _, _, _, _) do
    raise "nif_sarext/10 not implemented end"
  end

  def nif_sin(_) do
    raise "nif_sin/1 not implemented end"
  end

  def nif_sinh(_) do
    raise "nif_sinh/1 not implemented end"
  end

  def nif_sma(_, _) do
    raise "nif_sma/2 not implemented end"
  end

  def nif_sqrt(_) do
    raise "nif_sqrt/1 not implemented end"
  end

  def nif_stddev(_, _, _) do
    raise "nif_stddev/3 not implemented end"
  end

  def nif_stoch(_, _, _, _, _, _, _, _) do
    raise "nif_stoch/8 not implemented end"
  end

  def nif_stochf(_, _, _, _, _, _) do
    raise "nif_stochf/6 not implemented end"
  end

  def nif_stochrsi(_, _, _, _, _) do
    raise "nif_stochrsi/5 not implemented end"
  end

  def nif_sub(_, _) do
    raise "nif_sub/2 not implemented end"
  end

  def nif_sum(_, _) do
    raise "nif_sum/2 not implemented end"
  end

  def nif_t3(_, _, _) do
    raise "nif_t3/3 not implemented end"
  end

  def nif_tan(_) do
    raise "nif_tan/1 not implemented end"
  end

  def nif_tanh(_) do
    raise "nif_tanh/1 not implemented end"
  end

  def nif_tema(_, _) do
    raise "nif_tema/2 not implemented end"
  end

  def nif_trange(_, _, _) do
    raise "nif_trange/3 not implemented end"
  end

  def nif_trima(_, _) do
    raise "nif_trima/2 not implemented end"
  end

  def nif_trix(_, _) do
    raise "nif_trix/2 not implemented end"
  end

  def nif_tsf(_, _) do
    raise "nif_tsf/2 not implemented end"
  end

  def nif_typprice(_, _, _) do
    raise "nif_typprice/3 not implemented end"
  end

  def nif_ultosc(_, _, _, _, _, _) do
    raise "nif_ultosc/6 not implemented end"
  end

  def nif_var(_, _, _) do
    raise "nif_var/3 not implemented end"
  end

  def nif_wclprice(_, _, _) do
    raise "nif_wclprice/3 not implemented end"
  end

  def nif_willr(_, _, _, _) do
    raise "nif_willr/4 not implemented end"
  end

  def nif_wma(_, _) do
    raise "nif_wma/2 not implemented end"
  end
end
