/* GENERATED FILE */
#include "erl_nif.h"
#include "util.h"
#include "funcs.h"
#include <stdbool.h>

static int
load(ErlNifEnv *env, void **priv, ERL_NIF_TERM info)
{
     talib_st *st = enif_alloc(sizeof(talib_st));
     if (st == NULL)
     {
          return 1;
     }

     st->atom_nan = make_atom(env, "nan");
     st->atom_ok = make_atom(env, "ok");
     st->atom_error = make_atom(env, "error");
     st->atom_sma = make_atom(env, "sma");
     st->atom_ema = make_atom(env, "ema");
     st->atom_wma = make_atom(env, "wma");
     st->atom_dema = make_atom(env, "dema");
     st->atom_tema = make_atom(env, "tema");
     st->atom_trima = make_atom(env, "trima");
     st->atom_kama = make_atom(env, "kama");
     st->atom_mama = make_atom(env, "mama");
     st->atom_t3 = make_atom(env, "t3");

     *priv = (void *)st;

     return 0;
}

static int
reload(ErlNifEnv *env, void **priv, ERL_NIF_TERM info)
{
     return 0;
}

static int
upgrade(ErlNifEnv *env, void **priv, void **old_priv, ERL_NIF_TERM info)
{
     return load(env, priv, info);
}

static void
unload(ErlNifEnv *env, void *priv)
{
     enif_free(priv);
     return;
}

static ErlNifFunc funcs[] = {
  {"nif_accbands", 4, ex_accbands, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_acos", 1, ex_acos, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ad", 4, ex_ad, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_add", 2, ex_add, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_adosc", 6, ex_adosc, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_adx", 4, ex_adx, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_adxr", 4, ex_adxr, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_apo", 4, ex_apo, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_aroon", 3, ex_aroon, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_aroonosc", 3, ex_aroonosc, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_asin", 1, ex_asin, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_atan", 1, ex_atan, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_atr", 4, ex_atr, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_avgprice", 4, ex_avgprice, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_avgdev", 2, ex_avgdev, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_bbands", 5, ex_bbands, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_beta", 3, ex_beta, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_bop", 4, ex_bop, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cci", 4, ex_cci, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl2crows", 4, ex_cdl2crows, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3blackcrows", 4, ex_cdl3blackcrows, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3inside", 4, ex_cdl3inside, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3linestrike", 4, ex_cdl3linestrike, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3outside", 4, ex_cdl3outside, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3starsinsouth", 4, ex_cdl3starsinsouth, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3whitesoldiers", 4, ex_cdl3whitesoldiers, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlabandonedbaby", 5, ex_cdlabandonedbaby, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdladvanceblock", 4, ex_cdladvanceblock, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlbelthold", 4, ex_cdlbelthold, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlbreakaway", 4, ex_cdlbreakaway, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlclosingmarubozu", 4, ex_cdlclosingmarubozu, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlconcealbabyswall", 4, ex_cdlconcealbabyswall, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlcounterattack", 4, ex_cdlcounterattack, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdldarkcloudcover", 5, ex_cdldarkcloudcover, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdldoji", 4, ex_cdldoji, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdldojistar", 4, ex_cdldojistar, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdldragonflydoji", 4, ex_cdldragonflydoji, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlengulfing", 4, ex_cdlengulfing, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdleveningdojistar", 5, ex_cdleveningdojistar, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdleveningstar", 5, ex_cdleveningstar, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlgapsidesidewhite", 4, ex_cdlgapsidesidewhite, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlgravestonedoji", 4, ex_cdlgravestonedoji, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlhammer", 4, ex_cdlhammer, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlhangingman", 4, ex_cdlhangingman, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlharami", 4, ex_cdlharami, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlharamicross", 4, ex_cdlharamicross, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlhighwave", 4, ex_cdlhighwave, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlhikkake", 4, ex_cdlhikkake, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlhikkakemod", 4, ex_cdlhikkakemod, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlhomingpigeon", 4, ex_cdlhomingpigeon, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlidentical3crows", 4, ex_cdlidentical3crows, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlinneck", 4, ex_cdlinneck, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlinvertedhammer", 4, ex_cdlinvertedhammer, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlkicking", 4, ex_cdlkicking, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlkickingbylength", 4, ex_cdlkickingbylength, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlladderbottom", 4, ex_cdlladderbottom, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdllongleggeddoji", 4, ex_cdllongleggeddoji, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdllongline", 4, ex_cdllongline, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlmarubozu", 4, ex_cdlmarubozu, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlmatchinglow", 4, ex_cdlmatchinglow, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlmathold", 5, ex_cdlmathold, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlmorningdojistar", 5, ex_cdlmorningdojistar, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlmorningstar", 5, ex_cdlmorningstar, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlonneck", 4, ex_cdlonneck, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlpiercing", 4, ex_cdlpiercing, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlrickshawman", 4, ex_cdlrickshawman, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlrisefall3methods", 4, ex_cdlrisefall3methods, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlseparatinglines", 4, ex_cdlseparatinglines, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlshootingstar", 4, ex_cdlshootingstar, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlshortline", 4, ex_cdlshortline, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlspinningtop", 4, ex_cdlspinningtop, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlstalledpattern", 4, ex_cdlstalledpattern, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlsticksandwich", 4, ex_cdlsticksandwich, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdltakuri", 4, ex_cdltakuri, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdltasukigap", 4, ex_cdltasukigap, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlthrusting", 4, ex_cdlthrusting, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdltristar", 4, ex_cdltristar, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlunique3river", 4, ex_cdlunique3river, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlupsidegap2crows", 4, ex_cdlupsidegap2crows, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdlxsidegap3methods", 4, ex_cdlxsidegap3methods, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ceil", 1, ex_ceil, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cmo", 2, ex_cmo, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_correl", 3, ex_correl, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cos", 1, ex_cos, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cosh", 1, ex_cosh, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_dema", 2, ex_dema, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_div", 2, ex_div, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_dx", 4, ex_dx, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ema", 2, ex_ema, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_exp", 1, ex_exp, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_floor", 1, ex_floor, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ht_dcperiod", 1, ex_ht_dcperiod, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ht_dcphase", 1, ex_ht_dcphase, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ht_phasor", 1, ex_ht_phasor, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ht_sine", 1, ex_ht_sine, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ht_trendline", 1, ex_ht_trendline, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ht_trendmode", 1, ex_ht_trendmode, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_imi", 3, ex_imi, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_kama", 2, ex_kama, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_linearreg", 2, ex_linearreg, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_linearreg_angle", 2, ex_linearreg_angle, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_linearreg_intercept", 2, ex_linearreg_intercept, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_linearreg_slope", 2, ex_linearreg_slope, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ln", 1, ex_ln, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_log10", 1, ex_log10, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ma", 3, ex_ma, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_macd", 4, ex_macd, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_macdext", 7, ex_macdext, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_macdfix", 2, ex_macdfix, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mama", 3, ex_mama, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mavp", 5, ex_mavp, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_max", 2, ex_max, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_maxindex", 2, ex_maxindex, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_medprice", 2, ex_medprice, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mfi", 5, ex_mfi, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_midpoint", 2, ex_midpoint, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_midprice", 3, ex_midprice, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_min", 2, ex_min, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_minindex", 2, ex_minindex, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_minmax", 2, ex_minmax, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_minmaxindex", 2, ex_minmaxindex, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_minus_di", 4, ex_minus_di, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_minus_dm", 3, ex_minus_dm, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mom", 2, ex_mom, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mult", 2, ex_mult, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_natr", 4, ex_natr, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_obv", 2, ex_obv, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_plus_di", 4, ex_plus_di, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_plus_dm", 3, ex_plus_dm, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ppo", 4, ex_ppo, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_roc", 2, ex_roc, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_rocp", 2, ex_rocp, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_rocr", 2, ex_rocr, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_rocr100", 2, ex_rocr100, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_rsi", 2, ex_rsi, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_sar", 4, ex_sar, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_sarext", 10, ex_sarext, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_sin", 1, ex_sin, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_sinh", 1, ex_sinh, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_sma", 2, ex_sma, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_sqrt", 1, ex_sqrt, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_stddev", 3, ex_stddev, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_stoch", 8, ex_stoch, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_stochf", 6, ex_stochf, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_stochrsi", 5, ex_stochrsi, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_sub", 2, ex_sub, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_sum", 2, ex_sum, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_t3", 3, ex_t3, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_tan", 1, ex_tan, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_tanh", 1, ex_tanh, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_tema", 2, ex_tema, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_trange", 3, ex_trange, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_trima", 2, ex_trima, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_trix", 2, ex_trix, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_tsf", 2, ex_tsf, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_typprice", 3, ex_typprice, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ultosc", 6, ex_ultosc, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_var", 3, ex_var, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_wclprice", 3, ex_wclprice, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_willr", 4, ex_willr, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_wma", 2, ex_wma, ERL_NIF_DIRTY_JOB_CPU_BOUND}
};


ERL_NIF_INIT(Elixir.TalibEx.Nif, funcs, &load, &reload, &upgrade, &unload)
