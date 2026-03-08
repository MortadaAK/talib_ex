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

  def nif_accbands(_, _, _, _) do
    raise "nif_accbands/4 not implemented end"
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

  def nif_avgdev(_, _) do
    raise "nif_avgdev/2 not implemented end"
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

  def nif_cdl2crows(_, _, _, _) do
    raise "nif_cdl2crows/4 not implemented end"
  end

  def nif_cdl3blackcrows(_, _, _, _) do
    raise "nif_cdl3blackcrows/4 not implemented end"
  end

  def nif_cdl3inside(_, _, _, _) do
    raise "nif_cdl3inside/4 not implemented end"
  end

  def nif_cdl3linestrike(_, _, _, _) do
    raise "nif_cdl3linestrike/4 not implemented end"
  end

  def nif_cdl3outside(_, _, _, _) do
    raise "nif_cdl3outside/4 not implemented end"
  end

  def nif_cdl3starsinsouth(_, _, _, _) do
    raise "nif_cdl3starsinsouth/4 not implemented end"
  end

  def nif_cdl3whitesoldiers(_, _, _, _) do
    raise "nif_cdl3whitesoldiers/4 not implemented end"
  end

  def nif_cdlabandonedbaby(_, _, _, _, _) do
    raise "nif_cdlabandonedbaby/5 not implemented end"
  end

  def nif_cdladvanceblock(_, _, _, _) do
    raise "nif_cdladvanceblock/4 not implemented end"
  end

  def nif_cdlbelthold(_, _, _, _) do
    raise "nif_cdlbelthold/4 not implemented end"
  end

  def nif_cdlbreakaway(_, _, _, _) do
    raise "nif_cdlbreakaway/4 not implemented end"
  end

  def nif_cdlclosingmarubozu(_, _, _, _) do
    raise "nif_cdlclosingmarubozu/4 not implemented end"
  end

  def nif_cdlconcealbabyswall(_, _, _, _) do
    raise "nif_cdlconcealbabyswall/4 not implemented end"
  end

  def nif_cdlcounterattack(_, _, _, _) do
    raise "nif_cdlcounterattack/4 not implemented end"
  end

  def nif_cdldarkcloudcover(_, _, _, _, _) do
    raise "nif_cdldarkcloudcover/5 not implemented end"
  end

  def nif_cdldoji(_, _, _, _) do
    raise "nif_cdldoji/4 not implemented end"
  end

  def nif_cdldojistar(_, _, _, _) do
    raise "nif_cdldojistar/4 not implemented end"
  end

  def nif_cdldragonflydoji(_, _, _, _) do
    raise "nif_cdldragonflydoji/4 not implemented end"
  end

  def nif_cdlengulfing(_, _, _, _) do
    raise "nif_cdlengulfing/4 not implemented end"
  end

  def nif_cdleveningdojistar(_, _, _, _, _) do
    raise "nif_cdleveningdojistar/5 not implemented end"
  end

  def nif_cdleveningstar(_, _, _, _, _) do
    raise "nif_cdleveningstar/5 not implemented end"
  end

  def nif_cdlgapsidesidewhite(_, _, _, _) do
    raise "nif_cdlgapsidesidewhite/4 not implemented end"
  end

  def nif_cdlgravestonedoji(_, _, _, _) do
    raise "nif_cdlgravestonedoji/4 not implemented end"
  end

  def nif_cdlhammer(_, _, _, _) do
    raise "nif_cdlhammer/4 not implemented end"
  end

  def nif_cdlhangingman(_, _, _, _) do
    raise "nif_cdlhangingman/4 not implemented end"
  end

  def nif_cdlharami(_, _, _, _) do
    raise "nif_cdlharami/4 not implemented end"
  end

  def nif_cdlharamicross(_, _, _, _) do
    raise "nif_cdlharamicross/4 not implemented end"
  end

  def nif_cdlhighwave(_, _, _, _) do
    raise "nif_cdlhighwave/4 not implemented end"
  end

  def nif_cdlhikkake(_, _, _, _) do
    raise "nif_cdlhikkake/4 not implemented end"
  end

  def nif_cdlhikkakemod(_, _, _, _) do
    raise "nif_cdlhikkakemod/4 not implemented end"
  end

  def nif_cdlhomingpigeon(_, _, _, _) do
    raise "nif_cdlhomingpigeon/4 not implemented end"
  end

  def nif_cdlidentical3crows(_, _, _, _) do
    raise "nif_cdlidentical3crows/4 not implemented end"
  end

  def nif_cdlinneck(_, _, _, _) do
    raise "nif_cdlinneck/4 not implemented end"
  end

  def nif_cdlinvertedhammer(_, _, _, _) do
    raise "nif_cdlinvertedhammer/4 not implemented end"
  end

  def nif_cdlkicking(_, _, _, _) do
    raise "nif_cdlkicking/4 not implemented end"
  end

  def nif_cdlkickingbylength(_, _, _, _) do
    raise "nif_cdlkickingbylength/4 not implemented end"
  end

  def nif_cdlladderbottom(_, _, _, _) do
    raise "nif_cdlladderbottom/4 not implemented end"
  end

  def nif_cdllongleggeddoji(_, _, _, _) do
    raise "nif_cdllongleggeddoji/4 not implemented end"
  end

  def nif_cdllongline(_, _, _, _) do
    raise "nif_cdllongline/4 not implemented end"
  end

  def nif_cdlmarubozu(_, _, _, _) do
    raise "nif_cdlmarubozu/4 not implemented end"
  end

  def nif_cdlmatchinglow(_, _, _, _) do
    raise "nif_cdlmatchinglow/4 not implemented end"
  end

  def nif_cdlmathold(_, _, _, _, _) do
    raise "nif_cdlmathold/5 not implemented end"
  end

  def nif_cdlmorningdojistar(_, _, _, _, _) do
    raise "nif_cdlmorningdojistar/5 not implemented end"
  end

  def nif_cdlmorningstar(_, _, _, _, _) do
    raise "nif_cdlmorningstar/5 not implemented end"
  end

  def nif_cdlonneck(_, _, _, _) do
    raise "nif_cdlonneck/4 not implemented end"
  end

  def nif_cdlpiercing(_, _, _, _) do
    raise "nif_cdlpiercing/4 not implemented end"
  end

  def nif_cdlrickshawman(_, _, _, _) do
    raise "nif_cdlrickshawman/4 not implemented end"
  end

  def nif_cdlrisefall3methods(_, _, _, _) do
    raise "nif_cdlrisefall3methods/4 not implemented end"
  end

  def nif_cdlseparatinglines(_, _, _, _) do
    raise "nif_cdlseparatinglines/4 not implemented end"
  end

  def nif_cdlshootingstar(_, _, _, _) do
    raise "nif_cdlshootingstar/4 not implemented end"
  end

  def nif_cdlshortline(_, _, _, _) do
    raise "nif_cdlshortline/4 not implemented end"
  end

  def nif_cdlspinningtop(_, _, _, _) do
    raise "nif_cdlspinningtop/4 not implemented end"
  end

  def nif_cdlstalledpattern(_, _, _, _) do
    raise "nif_cdlstalledpattern/4 not implemented end"
  end

  def nif_cdlsticksandwich(_, _, _, _) do
    raise "nif_cdlsticksandwich/4 not implemented end"
  end

  def nif_cdltakuri(_, _, _, _) do
    raise "nif_cdltakuri/4 not implemented end"
  end

  def nif_cdltasukigap(_, _, _, _) do
    raise "nif_cdltasukigap/4 not implemented end"
  end

  def nif_cdlthrusting(_, _, _, _) do
    raise "nif_cdlthrusting/4 not implemented end"
  end

  def nif_cdltristar(_, _, _, _) do
    raise "nif_cdltristar/4 not implemented end"
  end

  def nif_cdlunique3river(_, _, _, _) do
    raise "nif_cdlunique3river/4 not implemented end"
  end

  def nif_cdlupsidegap2crows(_, _, _, _) do
    raise "nif_cdlupsidegap2crows/4 not implemented end"
  end

  def nif_cdlxsidegap3methods(_, _, _, _) do
    raise "nif_cdlxsidegap3methods/4 not implemented end"
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

  def nif_imi(_, _, _) do
    raise "nif_imi/3 not implemented end"
  end

  def nif_kama(_, _) do
    raise "nif_kama/2 not implemented end"
  end

  def nif_linearreg(_, _) do
    raise "nif_linearreg/2 not implemented end"
  end

  def nif_linearreg_angle(_, _) do
    raise "nif_linearreg_angle/2 not implemented end"
  end

  def nif_linearreg_intercept(_, _) do
    raise "nif_linearreg_intercept/2 not implemented end"
  end

  def nif_linearreg_slope(_, _) do
    raise "nif_linearreg_slope/2 not implemented end"
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

  def nif_maxindex(_, _) do
    raise "nif_maxindex/2 not implemented end"
  end

  def nif_medprice(_, _) do
    raise "nif_medprice/2 not implemented end"
  end

  def nif_mfi(_, _, _, _, _) do
    raise "nif_mfi/5 not implemented end"
  end

  def nif_midpoint(_, _) do
    raise "nif_midpoint/2 not implemented end"
  end

  def nif_midprice(_, _, _) do
    raise "nif_midprice/3 not implemented end"
  end

  def nif_min(_, _) do
    raise "nif_min/2 not implemented end"
  end

  def nif_minindex(_, _) do
    raise "nif_minindex/2 not implemented end"
  end

  def nif_minmax(_, _) do
    raise "nif_minmax/2 not implemented end"
  end

  def nif_minmaxindex(_, _) do
    raise "nif_minmaxindex/2 not implemented end"
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