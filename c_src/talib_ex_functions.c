#include "erl_nif.h"
#include "talib_ex_util.h"
#include "talib_ex_functions.h"
#include "ta_libc.h"
#include <stdbool.h>

ERL_NIF_TERM
ex_ACOS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     /* declare the variables */
     TAStruct eta;
     TAStruct *e = &eta;

     if (init_function_input_params(env, argc, argv, e) == 1)
     { /* something wrong with input arguments, clean up and return bad argument error */
          eta_destroy(e);
          return enif_make_badarg(env);
     }

     /* call TA-Lib function */
     TA_RetCode retCode = TA_ACOS(
         e->startIdx,
         e->endIdx,
         e->inClose,
         &e->outBegIdx,
         &e->outNBElement,
         &e->outDblValues0[0]);

     /* generate results */
     ERL_NIF_TERM results = eta_generate_results_double(e, retCode, e->outDblValues0);

     /* clean up */
     eta_destroy(e);

     /* return the results; */
     return results;
}

ERL_NIF_TERM
ex_AD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     /* declare the variables */
     TAStruct eta;
     TAStruct *e = &eta;

     if (init_function_input_params_with_double_out_array(env, argc, argv, e) == 1)
     { /* something wrong with input arguments, clean up and return bad argument error */
          eta_destroy(e);
          return enif_make_badarg(env);
     }

     /* call TA-Lib function */
     TA_RetCode retCode = TA_AD(
         e->startIdx,
         e->endIdx,
         e->inHigh,
         e->inLow,
         e->inClose,
         e->inVolume,
         &e->outBegIdx,
         &e->outNBElement,
         &e->outDblValues0[0]);

     /* generate results */
     ERL_NIF_TERM results = eta_generate_results_double(e, retCode, e->outDblValues0);

     /* clean up */
     eta_destroy(e);

     /* return the results; */
     return results;
}

ERL_NIF_TERM
ex_ADOSC(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     /* declare the variables */
     TAStruct eta;
     TAStruct *e = &eta;

     if (init_function_input_params_with_double_out_array(env, argc, argv, e) == 1)
     { /* something wrong with input arguments, clean up and return bad argument error */
          eta_destroy(e);
          return enif_make_badarg(env);
     }

     /* extract option values */
     int optInFastPeriod = (int)extract_option(env, argv[1], "fast_period", 2);
     int optInSlowPeriod = (int)extract_option(env, argv[1], "slow_period", 2);

     /* call TA-Lib function */
     TA_RetCode retCode = TA_ADOSC(
         e->startIdx,
         e->endIdx,
         e->inHigh,
         e->inLow,
         e->inClose,
         e->inVolume,
         optInFastPeriod,
         optInSlowPeriod,
         &e->outBegIdx,
         &e->outNBElement,
         &e->outDblValues0[0]);

     /* generate results */
     ERL_NIF_TERM results = eta_generate_results_double(e, retCode, e->outDblValues0);

     /* clean up */
     eta_destroy(e);

     /* return the results; */
     return results;
}

ERL_NIF_TERM
ex_ADX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     /* declare the variables */
     TAStruct eta;
     TAStruct *e = &eta;

     if (init_function_input_params_with_double_out_array(env, argc, argv, e) == 1)
     { /* something wrong with input arguments, clean up and return bad argument error */
          eta_destroy(e);
          return enif_make_badarg(env);
     }

     /* extract option values */
     int optInTimePeriod = (int)extract_option(env, argv[1], "timeperiod", 2);

     /* call TA-Lib function */
     TA_RetCode retCode = TA_ADX(
         e->startIdx,
         e->endIdx,
         e->inHigh,
         e->inLow,
         e->inClose,
         optInTimePeriod,
         &e->outBegIdx,
         &e->outNBElement,
         &e->outDblValues0[0]);

     /* generate results */
     ERL_NIF_TERM results = eta_generate_results_double(e, retCode, e->outDblValues0);

     /* clean up */
     eta_destroy(e);

     /* return the results; */
     return results;
}

/*

ERL_NIF_TERM  ex_ADXR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ADXR
}

ERL_NIF_TERM  ex_APO(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_APO
}

ERL_NIF_TERM  ex_AROON(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_AROON
}

ERL_NIF_TERM  ex_AROONOSC(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_AROONOSC
}

ERL_NIF_TERM  ex_ASIN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ASIN
}

ERL_NIF_TERM  ex_ATAN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ATAN
}

ERL_NIF_TERM  ex_ATR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ATR
}

ERL_NIF_TERM  ex_AVGPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_AVGPRICE
}

ERL_NIF_TERM  ex_BBANDS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_BBANDS
}

ERL_NIF_TERM  ex_BETA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_BETA
}

ERL_NIF_TERM  ex_BOP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_BOP
}

ERL_NIF_TERM  ex_CCI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CCI
}

ERL_NIF_TERM  ex_CDL2CROWS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL2CROWS
}

ERL_NIF_TERM  ex_CDL3BLACKCROWS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3BLACKCROWS
}

ERL_NIF_TERM  ex_CDL3INSIDE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3INSIDE
}

ERL_NIF_TERM  ex_CDL3LINESTRIKE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3LINESTRIKE
}

ERL_NIF_TERM  ex_CDL3OUTSIDE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3OUTSIDE
}

ERL_NIF_TERM  ex_CDL3STARSINSOUTH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3STARSINSOUTH
}

ERL_NIF_TERM  ex_CDL3WHITESOLDIERS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3WHITESOLDIERS
}

ERL_NIF_TERM  ex_CDLABANDONEDBABY(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLABANDONEDBABY
}

ERL_NIF_TERM  ex_CDLADVANCEBLOCK(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLADVANCEBLOCK
}

ERL_NIF_TERM  ex_CDLBELTHOLD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLBELTHOLD
}

ERL_NIF_TERM  ex_CDLBREAKAWAY(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLBREAKAWAY
}

ERL_NIF_TERM  ex_CDLCLOSINGMARUBOZU(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLCLOSINGMARUBOZU
}

ERL_NIF_TERM  ex_CDLCONCEALBABYSWALL(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLCONCEALBABYSWALL
}

ERL_NIF_TERM  ex_CDLCOUNTERATTACK(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLCOUNTERATTACK
}

ERL_NIF_TERM  ex_CDLDARKCLOUDCOVER(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLDARKCLOUDCOVER
}

ERL_NIF_TERM  ex_CDLDOJI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLDOJI
}

ERL_NIF_TERM  ex_CDLDOJISTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLDOJISTAR
}

ERL_NIF_TERM  ex_CDLDRAGONFLYDOJI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLDRAGONFLYDOJI
}

ERL_NIF_TERM  ex_CDLENGULFING(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLENGULFING
}

ERL_NIF_TERM  ex_CDLEVENINGDOJISTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLEVENINGDOJISTAR
}

ERL_NIF_TERM  ex_CDLEVENINGSTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLEVENINGSTAR
}

ERL_NIF_TERM  ex_CDLGAPSIDESIDEWHITE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLGAPSIDESIDEWHITE
}

ERL_NIF_TERM  ex_CDLGRAVESTONEDOJI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLGRAVESTONEDOJI
}

ERL_NIF_TERM  ex_CDLHAMMER(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHAMMER
}

ERL_NIF_TERM  ex_CDLHANGINGMAN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHANGINGMAN
}

ERL_NIF_TERM  ex_CDLHARAMI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHARAMI
}

ERL_NIF_TERM  ex_CDLHARAMICROSS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHARAMICROSS
}

ERL_NIF_TERM  ex_CDLHIGHWAVE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHIGHWAVE
}

ERL_NIF_TERM  ex_CDLHIKKAKE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHIKKAKE
}

ERL_NIF_TERM  ex_CDLHIKKAKEMOD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHIKKAKEMOD
}

ERL_NIF_TERM  ex_CDLHOMINGPIGEON(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHOMINGPIGEON
}

ERL_NIF_TERM  ex_CDLIDENTICAL3CROWS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLIDENTICAL3CROWS
}

ERL_NIF_TERM  ex_CDLINNECK(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLINNECK
}

ERL_NIF_TERM  ex_CDLINVERTEDHAMMER(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLINVERTEDHAMMER
}

ERL_NIF_TERM  ex_CDLKICKING(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLKICKING
}

ERL_NIF_TERM  ex_CDLKICKINGBYLENGTH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLKICKINGBYLENGTH
}

ERL_NIF_TERM  ex_CDLLADDERBOTTOM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLLADDERBOTTOM
}

ERL_NIF_TERM  ex_CDLLONGLEGGEDDOJI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLLONGLEGGEDDOJI
}

ERL_NIF_TERM  ex_CDLLONGLINE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLLONGLINE
}

ERL_NIF_TERM  ex_CDLMARUBOZU(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMARUBOZU
}

ERL_NIF_TERM  ex_CDLMATCHINGLOW(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMATCHINGLOW
}

ERL_NIF_TERM  ex_CDLMATHOLD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMATHOLD
}

ERL_NIF_TERM  ex_CDLMORNINGDOJISTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMORNINGDOJISTAR
}

ERL_NIF_TERM  ex_CDLMORNINGSTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMORNINGSTAR
}

ERL_NIF_TERM  ex_CDLONNECK(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLONNECK
}

ERL_NIF_TERM  ex_CDLPIERCING(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLPIERCING
}

ERL_NIF_TERM  ex_CDLRICKSHAWMAN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLRICKSHAWMAN
}

ERL_NIF_TERM  ex_CDLRISEFALL3METHODS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLRISEFALL3METHODS
}

ERL_NIF_TERM  ex_CDLSEPARATINGLINES(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSEPARATINGLINES
}

ERL_NIF_TERM  ex_CDLSHOOTINGSTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSHOOTINGSTAR
}

ERL_NIF_TERM  ex_CDLSHORTLINE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSHORTLINE
}

ERL_NIF_TERM  ex_CDLSPINNINGTOP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSPINNINGTOP
}

ERL_NIF_TERM  ex_CDLSTALLEDPATTERN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSTALLEDPATTERN
}

ERL_NIF_TERM  ex_CDLSTICKSANDWICH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSTICKSANDWICH
}

ERL_NIF_TERM  ex_CDLTAKURI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLTAKURI
}

ERL_NIF_TERM  ex_CDLTASUKIGAP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLTASUKIGAP
}

ERL_NIF_TERM  ex_CDLTHRUSTING(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLTHRUSTING
}

ERL_NIF_TERM  ex_CDLTRISTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLTRISTAR
}

ERL_NIF_TERM  ex_CDLUNIQUE3RIVER(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLUNIQUE3RIVER
}

ERL_NIF_TERM  ex_CDLUPSIDEGAP2CROWS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLUPSIDEGAP2CROWS
}

ERL_NIF_TERM  ex_CDLXSIDEGAP3METHODS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLXSIDEGAP3METHODS
}

ERL_NIF_TERM  ex_CEIL(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CEIL
}

ERL_NIF_TERM  ex_CMO(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CMO
}

ERL_NIF_TERM  ex_CORREL(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CORREL
}

ERL_NIF_TERM  ex_COS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_COS
}

ERL_NIF_TERM  ex_COSH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_COSH
}

ERL_NIF_TERM  ex_DEMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_DEMA
}

ERL_NIF_TERM  ex_DIV(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_DIV
}

ERL_NIF_TERM  ex_DX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_DX
}

ERL_NIF_TERM  ex_EMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_EMA
}

ERL_NIF_TERM  ex_EXP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_EXP
}

ERL_NIF_TERM  ex_FLOOR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_FLOOR
}

ERL_NIF_TERM  ex_HT_DCPERIOD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_DCPERIOD
}

ERL_NIF_TERM  ex_HT_DCPHASE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_DCPHASE
}

ERL_NIF_TERM  ex_HT_PHASOR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_PHASOR
}

ERL_NIF_TERM  ex_HT_SINE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_SINE
}

ERL_NIF_TERM  ex_HT_TRENDLINE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_TRENDLINE
}

ERL_NIF_TERM  ex_HT_TRENDMODE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_TRENDMODE
}

ERL_NIF_TERM  ex_KAMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_KAMA
}

ERL_NIF_TERM  ex_LINEARREG(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LINEARREG
}

ERL_NIF_TERM  ex_LINEARREG_ANGLE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LINEARREG_ANGLE
}

ERL_NIF_TERM  ex_LINEARREG_INTERCEPT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LINEARREG_INTERCEPT
}

ERL_NIF_TERM  ex_LINEARREG_SLOPE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LINEARREG_SLOPE
}

ERL_NIF_TERM  ex_LN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LN
}

ERL_NIF_TERM  ex_LOG10(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LOG10
}

ERL_NIF_TERM  ex_MA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MA
}

ERL_NIF_TERM  ex_MACD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MACD
}

ERL_NIF_TERM  ex_MACDEXT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MACDEXT
}

ERL_NIF_TERM  ex_MACDFIX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MACDFIX
}

ERL_NIF_TERM  ex_MAMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MAMA
}

ERL_NIF_TERM  ex_MAVP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MAVP
}

ERL_NIF_TERM  ex_MAX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MAX
}

ERL_NIF_TERM  ex_MAXINDEX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MAXINDEX
}

ERL_NIF_TERM  ex_MEDPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MEDPRICE
}

ERL_NIF_TERM  ex_MFI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MFI
}

ERL_NIF_TERM  ex_MIDPOINT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MIDPOINT
}

ERL_NIF_TERM  ex_MIDPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MIDPRICE
}

ERL_NIF_TERM  ex_MIN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MIN
}

ERL_NIF_TERM  ex_MININDEX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MININDEX
}

ERL_NIF_TERM  ex_MINMAX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MINMAX
}

ERL_NIF_TERM  ex_MINMAXINDEX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MINMAXINDEX
}

ERL_NIF_TERM  ex_MINUS_DI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MINUS_DI
}

ERL_NIF_TERM  ex_MINUS_DM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MINUS_DM
}

ERL_NIF_TERM  ex_MOM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MOM
}

ERL_NIF_TERM  ex_MULT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MULT
}

ERL_NIF_TERM  ex_NATR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_NATR
}

ERL_NIF_TERM  ex_OBV(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_OBV
}

ERL_NIF_TERM  ex_PLUS_DI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_PLUS_DI
}

ERL_NIF_TERM  ex_PLUS_DM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_PLUS_DM
}

ERL_NIF_TERM  ex_PPO(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_PPO
}

ERL_NIF_TERM  ex_ROC(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ROC
}

ERL_NIF_TERM  ex_ROCP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ROCP
}

ERL_NIF_TERM  ex_ROCR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ROCR
}

ERL_NIF_TERM  ex_ROCR100(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ROCR100
}

ERL_NIF_TERM  ex_RSI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_RSI
}

ERL_NIF_TERM  ex_SAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_SAR
}

ERL_NIF_TERM  ex_SAREXT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_SAREXT
}

ERL_NIF_TERM  ex_SIN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_SIN
}

ERL_NIF_TERM  ex_SINH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_SINH
}
*/

ERL_NIF_TERM ex_SMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     return call_function_with_one_in_array_and_one_argument(env, argc, argv, "window", &TA_SMA);
}

ERL_NIF_TERM ex_SQRT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     return call_function_with_one_in_array(env, argc, argv, &TA_SQRT);
}
/*

 ERL_NIF_TERM   ex_STDDEV(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_STDDEV
 }

 ERL_NIF_TERM   ex_STOCH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_STOCH
 }

 ERL_NIF_TERM   ex_STOCHF(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_STOCHF
 }

 ERL_NIF_TERM   ex_STOCHRSI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_STOCHRSI
 }

 ERL_NIF_TERM   ex_SUB(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_SUB
 }

 ERL_NIF_TERM   ex_SUM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_SUM
 }

 ERL_NIF_TERM   ex_T3(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_T3
 }

 ERL_NIF_TERM   ex_TAN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TAN
 }

 ERL_NIF_TERM   ex_TANH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TANH
 }

 ERL_NIF_TERM   ex_TEMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TEMA
 }

 ERL_NIF_TERM   ex_TRANGE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TRANGE
 }

 ERL_NIF_TERM   ex_TRIMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TRIMA
 }

 ERL_NIF_TERM   ex_TRIX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TRIX
 }

 ERL_NIF_TERM   ex_TSF(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TSF
 }

 ERL_NIF_TERM   ex_TYPPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TYPPRICE
 }

 ERL_NIF_TERM   ex_ULTOSC(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_ULTOSC
 }

 ERL_NIF_TERM   ex_VAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_VAR
 }

 ERL_NIF_TERM   ex_WCLPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_WCLPRICE
 }

 ERL_NIF_TERM   ex_WILLR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_WILLR
 }

 ERL_NIF_TERM   ex_WMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_WMA
}
*/