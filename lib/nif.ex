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

  def nif_acos(_, _) do
    raise "nif_acos/2 not implemented end"
  end

  def nif_ad(_, _) do
    raise "nif_ad/2 not implemented"
  end

  def nif_add(_, _) do
    raise "nif_add/2 not implemented"
  end

  def nif_adosc(_, _) do
    raise "nif_adosc/2 not implemented"
  end

  def nif_adx(_, _) do
    raise "nif_adx/2 not implemented"
  end

  def nif_adxr(_, _) do
    raise "nif_adxr/2 not implemented"
  end

  def nif_apo(_, _) do
    raise "nif_apo/2 not implemented"
  end

  def nif_aroon(_, _) do
    raise "nif_aroon/2 not implemented"
  end

  def nif_aroonosc(_, _) do
    raise "nif_aroonosc/2 not implemented"
  end

  def nif_asin(_, _) do
    raise "nif_asin/2 not implemented"
  end

  def nif_atan(_, _) do
    raise "nif_atan/2 not implemented"
  end

  def nif_atr(_, _) do
    raise "nif_atr/2 not implemented"
  end

  def nif_avgprice(_, _) do
    raise "nif_avgprice/2 not implemented"
  end

  def nif_bbands(_, _) do
    raise "nif_bbands/2 not implemented"
  end

  def nif_beta(_, _) do
    raise "nif_beta/2 not implemented"
  end

  def nif_bop(_, _) do
    raise "nif_bop/2 not implemented"
  end

  def nif_cci(_, _) do
    raise "nif_cci/2 not implemented"
  end

  def nif_cdl2_crows(_, _) do
    raise "nif_cdl2_crows/2 not implemented"
  end

  def nif_cdl3_blackcrows(_, _) do
    raise "nif_cdl3_blackcrows/2 not implemented"
  end

  def nif_cdl3_inside(_, _) do
    raise "nif_cdl3_inside/2 not implemented"
  end

  def nif_cdl3_linestrike(_, _) do
    raise "nif_cdl3_linestrike/2 not implemented"
  end

  def nif_cdl3_outside(_, _) do
    raise "nif_cdl3_outside/2 not implemented"
  end

  def nif_cdl3_starsinsouth(_, _) do
    raise "nif_cdl3_starsinsouth/2 not implemented"
  end

  def nif_cdl3_whitesoldiers(_, _) do
    raise "nif_cdl3_whitesoldiers/2 not implemented"
  end

  def nif_cdlabandonedbaby(_, _) do
    raise "nif_cdlabandonedbaby/2 not implemented"
  end

  def nif_cdladvanceblock(_, _) do
    raise "nif_cdladvanceblock/2 not implemented"
  end

  def nif_cdlbelthold(_, _) do
    raise "nif_cdlbelthold/2 not implemented"
  end

  def nif_cdlbreakaway(_, _) do
    raise "nif_cdlbreakaway/2 not implemented"
  end

  def nif_cdlclosingmarubozu(_, _) do
    raise "nif_cdlclosingmarubozu/2 not implemented"
  end

  def nif_cdlconcealbabyswall(_, _) do
    raise "nif_cdlconcealbabyswall/2 not implemented"
  end

  def nif_cdlcounterattack(_, _) do
    raise "nif_cdlcounterattack/2 not implemented"
  end

  def nif_cdldarkcloudcover(_, _) do
    raise "nif_cdldarkcloudcover/2 not implemented"
  end

  def nif_cdldoji(_, _) do
    raise "nif_cdldoji/2 not implemented"
  end

  def nif_cdldojistar(_, _) do
    raise "nif_cdldojistar/2 not implemented"
  end

  def nif_cdldragonflydoji(_, _) do
    raise "nif_cdldragonflydoji/2 not implemented"
  end

  def nif_cdlengulfing(_, _) do
    raise "nif_cdlengulfing/2 not implemented"
  end

  def nif_cdleveningdojistar(_, _) do
    raise "nif_cdleveningdojistar/2 not implemented"
  end

  def nif_cdleveningstar(_, _) do
    raise "nif_cdleveningstar/2 not implemented"
  end

  def nif_cdlgapsidesidewhite(_, _) do
    raise "nif_cdlgapsidesidewhite/2 not implemented"
  end

  def nif_cdlgravestonedoji(_, _) do
    raise "nif_cdlgravestonedoji/2 not implemented"
  end

  def nif_cdlhammer(_, _) do
    raise "nif_cdlhammer/2 not implemented"
  end

  def nif_cdlhangingman(_, _) do
    raise "nif_cdlhangingman/2 not implemented"
  end

  def nif_cdlharami(_, _) do
    raise "nif_cdlharami/2 not implemented"
  end

  def nif_cdlharamicross(_, _) do
    raise "nif_cdlharamicross/2 not implemented"
  end

  def nif_cdlhighwave(_, _) do
    raise "nif_cdlhighwave/2 not implemented"
  end

  def nif_cdlhikkake(_, _) do
    raise "nif_cdlhikkake/2 not implemented"
  end

  def nif_cdlhikkakemod(_, _) do
    raise "nif_cdlhikkakemod/2 not implemented"
  end

  def nif_cdlhomingpigeon(_, _) do
    raise "nif_cdlhomingpigeon/2 not implemented"
  end

  def nif_cdlidentical3_crows(_, _) do
    raise "nif_cdlidentical3_crows/2 not implemented"
  end

  def nif_cdlinneck(_, _) do
    raise "nif_cdlinneck/2 not implemented"
  end

  def nif_cdlinvertedhammer(_, _) do
    raise "nif_cdlinvertedhammer/2 not implemented"
  end

  def nif_cdlkicking(_, _) do
    raise "nif_cdlkicking/2 not implemented"
  end

  def nif_cdlkickingbylength(_, _) do
    raise "nif_cdlkickingbylength/2 not implemented"
  end

  def nif_cdlladderbottom(_, _) do
    raise "nif_cdlladderbottom/2 not implemented"
  end

  def nif_cdllongleggeddoji(_, _) do
    raise "nif_cdllongleggeddoji/2 not implemented"
  end

  def nif_cdllongline(_, _) do
    raise "nif_cdllongline/2 not implemented"
  end

  def nif_cdlmarubozu(_, _) do
    raise "nif_cdlmarubozu/2 not implemented"
  end

  def nif_cdlmatchinglow(_, _) do
    raise "nif_cdlmatchinglow/2 not implemented"
  end

  def nif_cdlmathold(_, _) do
    raise "nif_cdlmathold/2 not implemented"
  end

  def nif_cdlmorningdojistar(_, _) do
    raise "nif_cdlmorningdojistar/2 not implemented"
  end

  def nif_cdlmorningstar(_, _) do
    raise "nif_cdlmorningstar/2 not implemented"
  end

  def nif_cdlonneck(_, _) do
    raise "nif_cdlonneck/2 not implemented"
  end

  def nif_cdlpiercing(_, _) do
    raise "nif_cdlpiercing/2 not implemented"
  end

  def nif_cdlrickshawman(_, _) do
    raise "nif_cdlrickshawman/2 not implemented"
  end

  def nif_cdlrisefall3_methods(_, _) do
    raise "nif_cdlrisefall3_methods/2 not implemented"
  end

  def nif_cdlseparatinglines(_, _) do
    raise "nif_cdlseparatinglines/2 not implemented"
  end

  def nif_cdlshootingstar(_, _) do
    raise "nif_cdlshootingstar/2 not implemented"
  end

  def nif_cdlshortline(_, _) do
    raise "nif_cdlshortline/2 not implemented"
  end

  def nif_cdlspinningtop(_, _) do
    raise "nif_cdlspinningtop/2 not implemented"
  end

  def nif_cdlstalledpattern(_, _) do
    raise "nif_cdlstalledpattern/2 not implemented"
  end

  def nif_cdlsticksandwich(_, _) do
    raise "nif_cdlsticksandwich/2 not implemented"
  end

  def nif_cdltakuri(_, _) do
    raise "nif_cdltakuri/2 not implemented"
  end

  def nif_cdltasukigap(_, _) do
    raise "nif_cdltasukigap/2 not implemented"
  end

  def nif_cdlthrusting(_, _) do
    raise "nif_cdlthrusting/2 not implemented"
  end

  def nif_cdltristar(_, _) do
    raise "nif_cdltristar/2 not implemented"
  end

  def nif_cdlunique3_river(_, _) do
    raise "nif_cdlunique3_river/2 not implemented"
  end

  def nif_cdlupsidegap2_crows(_, _) do
    raise "nif_cdlupsidegap2_crows/2 not implemented"
  end

  def nif_cdlxsidegap3_methods(_, _) do
    raise "nif_cdlxsidegap3_methods/2 not implemented"
  end

  def nif_ceil(_, _) do
    raise "nif_ceil/2 not implemented"
  end

  def nif_cmo(_, _) do
    raise "nif_cmo/2 not implemented"
  end

  def nif_correl(_, _) do
    raise "nif_correl/2 not implemented"
  end

  def nif_cos(_, _) do
    raise "nif_cos/2 not implemented"
  end

  def nif_cosh(_, _) do
    raise "nif_cosh/2 not implemented"
  end

  def nif_dema(_, _) do
    raise "nif_dema/2 not implemented"
  end

  def nif_div(_, _) do
    raise "nif_div/2 not implemented"
  end

  def nif_dx(_, _) do
    raise "nif_dx/2 not implemented"
  end

  def nif_ema(_, _) do
    raise "nif_ema/2 not implemented"
  end

  def nif_exp(_, _) do
    raise "nif_exp/2 not implemented"
  end

  def nif_floor(_, _) do
    raise "nif_floor/2 not implemented"
  end

  def nif_ht_dcperiod(_, _) do
    raise "nif_ht_dcperiod/2 not implemented"
  end

  def nif_ht_dcphase(_, _) do
    raise "nif_ht_dcphase/2 not implemented"
  end

  def nif_ht_phasor(_, _) do
    raise "nif_ht_phasor/2 not implemented"
  end

  def nif_ht_sine(_, _) do
    raise "nif_ht_sine/2 not implemented"
  end

  def nif_ht_trendline(_, _) do
    raise "nif_ht_trendline/2 not implemented"
  end

  def nif_ht_trendmode(_, _) do
    raise "nif_ht_trendmode/2 not implemented"
  end

  def nif_kama(_, _) do
    raise "nif_kama/2 not implemented"
  end

  def nif_linearreg(_, _) do
    raise "nif_linearreg/2 not implemented"
  end

  def nif_linearreg_angle(_, _) do
    raise "nif_linearreg_angle/2 not implemented"
  end

  def nif_linearreg_intercept(_, _) do
    raise "nif_linearreg_intercept/2 not implemented"
  end

  def nif_linearreg_slope(_, _) do
    raise "nif_linearreg_slope/2 not implemented"
  end

  def nif_ln(_, _) do
    raise "nif_ln/2 not implemented"
  end

  def nif_log10(_, _) do
    raise "nif_log10/2 not implemented"
  end

  def nif_ma(_, _) do
    raise "nif_ma/2 not implemented"
  end

  def nif_macd(_, _) do
    raise "nif_macd/2 not implemented"
  end

  def nif_macdext(_, _) do
    raise "nif_macdext/2 not implemented"
  end

  def nif_macdfix(_, _) do
    raise "nif_macdfix/2 not implemented"
  end

  def nif_mama(_, _) do
    raise "nif_mama/2 not implemented"
  end

  def nif_mavp(_, _) do
    raise "nif_mavp/2 not implemented"
  end

  def nif_max(_, _) do
    raise "nif_max/2 not implemented"
  end

  def nif_maxindex(_, _) do
    raise "nif_maxindex/2 not implemented"
  end

  def nif_medprice(_, _) do
    raise "nif_medprice/2 not implemented"
  end

  def nif_mfi(_, _) do
    raise "nif_mfi/2 not implemented"
  end

  def nif_midpoint(_, _) do
    raise "nif_midpoint/2 not implemented"
  end

  def nif_midprice(_, _) do
    raise "nif_midprice/2 not implemented"
  end

  def nif_min(_, _) do
    raise "nif_min/2 not implemented"
  end

  def nif_minindex(_, _) do
    raise "nif_minindex/2 not implemented"
  end

  def nif_minmax(_, _) do
    raise "nif_minmax/2 not implemented"
  end

  def nif_minmaxindex(_, _) do
    raise "nif_minmaxindex/2 not implemented"
  end

  def nif_minus_di(_, _) do
    raise "nif_minus_di/2 not implemented"
  end

  def nif_minus_dm(_, _) do
    raise "nif_minus_dm/2 not implemented"
  end

  def nif_mom(_, _) do
    raise "nif_mom/2 not implemented"
  end

  def nif_mult(_, _) do
    raise "nif_mult/2 not implemented"
  end

  def nif_natr(_, _) do
    raise "nif_natr/2 not implemented"
  end

  def nif_obv(_, _) do
    raise "nif_obv/2 not implemented"
  end

  def nif_plus_di(_, _) do
    raise "nif_plus_di/2 not implemented"
  end

  def nif_plus_dm(_, _) do
    raise "nif_plus_dm/2 not implemented"
  end

  def nif_ppo(_, _) do
    raise "nif_ppo/2 not implemented"
  end

  def nif_roc(_, _) do
    raise "nif_roc/2 not implemented"
  end

  def nif_rocp(_, _) do
    raise "nif_rocp/2 not implemented"
  end

  def nif_rocr(_, _) do
    raise "nif_rocr/2 not implemented"
  end

  def nif_rocr100(_, _) do
    raise "nif_rocr100/2 not implemented"
  end

  def nif_rsi(_, _) do
    raise "nif_rsi/2 not implemented"
  end

  def nif_sar(_, _) do
    raise "nif_sar/2 not implemented"
  end

  def nif_sarext(_, _) do
    raise "nif_sarext/2 not implemented"
  end

  def nif_sin(_, _) do
    raise "nif_sin/2 not implemented"
  end

  def nif_sinh(_, _) do
    raise "nif_sinh/2 not implemented"
  end

  def nif_sma(_, _) do
    raise "nif_sma/2 not implemented"
  end

  def nif_sqrt(_, _) do
    raise "nif_sqrt/2 not implemented"
  end

  def nif_stddev(_, _) do
    raise "nif_stddev/2 not implemented"
  end

  def nif_stoch(_, _) do
    raise "nif_stoch/2 not implemented"
  end

  def nif_stochf(_, _) do
    raise "nif_stochf/2 not implemented"
  end

  def nif_stochrsi(_, _) do
    raise "nif_stochrsi/2 not implemented"
  end

  def nif_sub(_, _) do
    raise "nif_sub/2 not implemented"
  end

  def nif_sum(_, _) do
    raise "nif_sum/2 not implemented"
  end

  def nif_t3(_, _) do
    raise "nif_t3/2 not implemented"
  end

  def nif_tan(_, _) do
    raise "nif_tan/2 not implemented"
  end

  def nif_tanh(_, _) do
    raise "nif_tanh/2 not implemented"
  end

  def nif_tema(_, _) do
    raise "nif_tema/2 not implemented"
  end

  def nif_trange(_, _) do
    raise "nif_trange/2 not implemented"
  end

  def nif_trima(_, _) do
    raise "nif_trima/2 not implemented"
  end

  def nif_trix(_, _) do
    raise "nif_trix/2 not implemented"
  end

  def nif_tsf(_, _) do
    raise "nif_tsf/2 not implemented"
  end

  def nif_typprice(_, _) do
    raise "nif_typprice/2 not implemented"
  end

  def nif_ultosc(_, _) do
    raise "nif_ultosc/2 not implemented"
  end

  def nif_var(_, _) do
    raise "nif_var/2 not implemented"
  end

  def nif_wclprice(_, _) do
    raise "nif_wclprice/2 not implemented"
  end

  def nif_willr(_, _) do
    raise "nif_willr/2 not implemented"
  end

  def nif_wma(_, _) do
    raise "nif_wma/2 not implemented"
  end
end
