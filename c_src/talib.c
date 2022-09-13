#include "erl_nif.h"
#include "talib_ex_util.h"
#include "talib_ex_functions.h"
#include "ta_libc.h"
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
     st->atom_open = make_atom(env, "open");
     st->atom_high = make_atom(env, "high");
     st->atom_low = make_atom(env, "low");
     st->atom_close = make_atom(env, "close");
     st->atom_volume = make_atom(env, "volume");
     st->atom_period = make_atom(env, "period");
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
    {"nif_acos", 2, ex_ACOS, 0},
    {"nif_ad", 2, ex_AD, 0},
    {"nif_add", 2, ex_add, 0},
    {"nif_adosc", 2, ex_ADOSC, 0},
    {"nif_adx", 2, ex_ADX, 0},
    /*
       {"nif_adxr", 2, ex_ADXR,0},
       {"nif_apo", 2, ex_APO,0},
       {"nif_aroon", 2, ex_AROON,0},
       {"nif_aroonosc", 2, ex_AROONOSC,0},
       {"nif_asin", 2, ex_ASIN,0},
       {"nif_atan", 2, ex_ATAN,0},
       {"nif_atr", 2, ex_ATR,0},
       {"nif_avgprice", 2, ex_AVGPRICE,0},
       {"nif_bbands", 2, ex_BBANDS,0},
       {"nif_beta", 2, ex_BETA,0},
       {"nif_bop", 2, ex_BOP,0},
       {"nif_cci", 2, ex_CCI,0},
       {"nif_cdl2_crows", 2, ex_CDL2CROWS,0},
       {"nif_cdl3_blackcrows", 2, ex_CDL3BLACKCROWS,0},
       {"nif_cdl3_inside", 2, ex_CDL3INSIDE,0},
       {"nif_cdl3_linestrike", 2, ex_CDL3LINESTRIKE,0},
       {"nif_cdl3_outside", 2, ex_CDL3OUTSIDE,0},
       {"nif_cdl3_starsinsouth", 2, ex_CDL3STARSINSOUTH,0},
       {"nif_cdl3_whitesoldiers", 2, ex_CDL3WHITESOLDIERS,0},
       {"nif_cdlabandonedbaby", 2, ex_CDLABANDONEDBABY,0},
       {"nif_cdladvanceblock", 2, ex_CDLADVANCEBLOCK,0},
       {"nif_cdlbelthold", 2, ex_CDLBELTHOLD,0},
       {"nif_cdlbreakaway", 2, ex_CDLBREAKAWAY,0},
       {"nif_cdlclosingmarubozu", 2, ex_CDLCLOSINGMARUBOZU,0},
       {"nif_cdlconcealbabyswall", 2, ex_CDLCONCEALBABYSWALL,0},
       {"nif_cdlcounterattack", 2, ex_CDLCOUNTERATTACK,0},
       {"nif_cdldarkcloudcover", 2, ex_CDLDARKCLOUDCOVER,0},
       {"nif_cdldoji", 2, ex_CDLDOJI,0},
       {"nif_cdldojistar", 2, ex_CDLDOJISTAR,0},
       {"nif_cdldragonflydoji", 2, ex_CDLDRAGONFLYDOJI,0},
       {"nif_cdlengulfing", 2, ex_CDLENGULFING,0},
       {"nif_cdleveningdojistar", 2, ex_CDLEVENINGDOJISTAR,0},
       {"nif_cdleveningstar", 2, ex_CDLEVENINGSTAR,0},
       {"nif_cdlgapsidesidewhite", 2, ex_CDLGAPSIDESIDEWHITE,0},
       {"nif_cdlgravestonedoji", 2, ex_CDLGRAVESTONEDOJI,0},
       {"nif_cdlhammer", 2, ex_CDLHAMMER,0},
       {"nif_cdlhangingman", 2, ex_CDLHANGINGMAN,0},
       {"nif_cdlharami", 2, ex_CDLHARAMI,0},
       {"nif_cdlharamicross", 2, ex_CDLHARAMICROSS,0},
       {"nif_cdlhighwave", 2, ex_CDLHIGHWAVE,0},
       {"nif_cdlhikkake", 2, ex_CDLHIKKAKE,0},
       {"nif_cdlhikkakemod", 2, ex_CDLHIKKAKEMOD,0},
       {"nif_cdlhomingpigeon", 2, ex_CDLHOMINGPIGEON,0},
       {"nif_cdlidentical3_crows", 2, ex_CDLIDENTICAL3CROWS,0},
       {"nif_cdlinneck", 2, ex_CDLINNECK,0},
       {"nif_cdlinvertedhammer", 2, ex_CDLINVERTEDHAMMER,0},
       {"nif_cdlkicking", 2, ex_CDLKICKING,0},
       {"nif_cdlkickingbylength", 2, ex_CDLKICKINGBYLENGTH,0},
       {"nif_cdlladderbottom", 2, ex_CDLLADDERBOTTOM,0},
       {"nif_cdllongleggeddoji", 2, ex_CDLLONGLEGGEDDOJI,0},
       {"nif_cdllongline", 2, ex_CDLLONGLINE,0},
       {"nif_cdlmarubozu", 2, ex_CDLMARUBOZU,0},
       {"nif_cdlmatchinglow", 2, ex_CDLMATCHINGLOW,0},
       {"nif_cdlmathold", 2, ex_CDLMATHOLD,0},
       {"nif_cdlmorningdojistar", 2, ex_CDLMORNINGDOJISTAR,0},
       {"nif_cdlmorningstar", 2, ex_CDLMORNINGSTAR,0},
       {"nif_cdlonneck", 2, ex_CDLONNECK,0},
       {"nif_cdlpiercing", 2, ex_CDLPIERCING,0},
       {"nif_cdlrickshawman", 2, ex_CDLRICKSHAWMAN,0},
       {"nif_cdlrisefall3_methods", 2, ex_CDLRISEFALL3METHODS,0},
       {"nif_cdlseparatinglines", 2, ex_CDLSEPARATINGLINES,0},
       {"nif_cdlshootingstar", 2, ex_CDLSHOOTINGSTAR,0},
       {"nif_cdlshortline", 2, ex_CDLSHORTLINE,0},
       {"nif_cdlspinningtop", 2, ex_CDLSPINNINGTOP,0},
       {"nif_cdlstalledpattern", 2, ex_CDLSTALLEDPATTERN,0},
       {"nif_cdlsticksandwich", 2, ex_CDLSTICKSANDWICH,0},
       {"nif_cdltakuri", 2, ex_CDLTAKURI,0},
       {"nif_cdltasukigap", 2, ex_CDLTASUKIGAP,0},
       {"nif_cdlthrusting", 2, ex_CDLTHRUSTING,0},
       {"nif_cdltristar", 2, ex_CDLTRISTAR,0},
       {"nif_cdlunique3_river", 2, ex_CDLUNIQUE3RIVER,0},
       {"nif_cdlupsidegap2_crows", 2, ex_CDLUPSIDEGAP2CROWS,0},
       {"nif_cdlxsidegap3_methods", 2, ex_CDLXSIDEGAP3METHODS,0},
       {"nif_ceil", 2, ex_CEIL,0},
       {"nif_cmo", 2, ex_CMO,0},
       {"nif_correl", 2, ex_CORREL,0},
       {"nif_cos", 2, ex_COS,0},
       {"nif_cosh", 2, ex_COSH,0},
       {"nif_dema", 2, ex_DEMA,0},
       {"nif_div", 2, ex_DIV,0},
       {"nif_dx", 2, ex_DX,0},
       {"nif_ema", 2, ex_EMA,0},
       {"nif_exp", 2, ex_EXP,0},
       {"nif_floor", 2, ex_FLOOR,0},
       {"nif_ht_dcperiod", 2, ex_HT_DCPERIOD,0},
       {"nif_ht_dcphase", 2, ex_HT_DCPHASE,0},
       {"nif_ht_phasor", 2, ex_HT_PHASOR,0},
       {"nif_ht_sine", 2, ex_HT_SINE,0},
       {"nif_ht_trendline", 2, ex_HT_TRENDLINE,0},
       {"nif_ht_trendmode", 2, ex_HT_TRENDMODE,0},
       {"nif_kama", 2, ex_KAMA,0},
       {"nif_linearreg", 2, ex_LINEARREG,0},
       {"nif_linearreg_angle", 2, ex_LINEARREG_ANGLE,0},
       {"nif_linearreg_intercept", 2, ex_LINEARREG_INTERCEPT,0},
       {"nif_linearreg_slope", 2, ex_LINEARREG_SLOPE,0},
       {"nif_ln", 2, ex_LN,0},
       {"nif_log10", 2, ex_LOG10,0},
       {"nif_ma", 2, ex_MA,0},
       {"nif_macd", 2, ex_MACD,0},
       {"nif_macdext", 2, ex_MACDEXT,0},
       {"nif_macdfix", 2, ex_MACDFIX,0},
       {"nif_mama", 2, ex_MAMA,0},
       {"nif_mavp", 2, ex_MAVP,0},
       {"nif_max", 2, ex_MAX,0},
       {"nif_maxindex", 2, ex_MAXINDEX,0},
       {"nif_medprice", 2, ex_MEDPRICE,0},
       {"nif_mfi", 2, ex_MFI,0},
       {"nif_midpoint", 2, ex_MIDPOINT,0},
       {"nif_midprice", 2, ex_MIDPRICE,0},
       {"nif_min", 2, ex_MIN,0},
       {"nif_minindex", 2, ex_MININDEX,0},
       {"nif_minmax", 2, ex_MINMAX,0},
       {"nif_minmaxindex", 2, ex_MINMAXINDEX,0},
       {"nif_minus_di", 2, ex_MINUS_DI,0},
       {"nif_minus_dm", 2, ex_MINUS_DM,0},
       {"nif_mom", 2, ex_MOM,0},
       {"nif_mult", 2, ex_MULT,0},
       {"nif_natr", 2, ex_NATR,0},
       {"nif_obv", 2, ex_OBV,0},
       {"nif_plus_di", 2, ex_PLUS_DI,0},
       {"nif_plus_dm", 2, ex_PLUS_DM,0},
       {"nif_ppo", 2, ex_PPO,0},
       {"nif_roc", 2, ex_ROC,0},
       {"nif_rocp", 2, ex_ROCP,0},
       {"nif_rocr", 2, ex_ROCR,0},
       {"nif_rocr100", 2, ex_ROCR100,0},
       {"nif_rsi", 2, ex_RSI,0},
       {"nif_sar", 2, ex_SAR,0},
       {"nif_sarext", 2, ex_SAREXT,0},
       {"nif_sin", 2, ex_SIN,0},
       {"nif_sinh", 2, ex_SINH,0},
      */
    {"nif_sma", 2, ex_SMA, 0},
    {"nif_sqrt", 2, ex_SQRT, 0},
    /*
    {"nif_stddev", 2, ex_STDDEV,0},
    {"nif_stoch", 2, ex_STOCH,0},
    {"nif_stochf", 2, ex_STOCHF,0},
    {"nif_stochrsi", 2, ex_STOCHRSI,0},
    {"nif_sub", 2, ex_SUB,0},
    {"nif_sum", 2, ex_SUM,0},
    {"nif_t3", 2, ex_T3,0},
    {"nif_tan", 2, ex_TAN,0},
    {"nif_tanh", 2, ex_TANH,0},
    {"nif_tema", 2, ex_TEMA,0},
    {"nif_trange", 2, ex_TRANGE,0},
    {"nif_trima", 2, ex_TRIMA,0},
    {"nif_trix", 2, ex_TRIX,0},
    {"nif_tsf", 2, ex_TSF,0},
    {"nif_typprice", 2, ex_TYPPRICE,0},
    {"nif_ultosc", 2, ex_ULTOSC,0},
    {"nif_var", 2, ex_VAR,0},
    {"nif_wclprice", 2, ex_WCLPRICE,0},
    {"nif_willr", 2, ex_WILLR,0},
    {"nif_wma", 2, ex_WMA,0},
*/
};

ERL_NIF_INIT(Elixir.TalibEx.Nif, funcs, &load, &reload, &upgrade, &unload)