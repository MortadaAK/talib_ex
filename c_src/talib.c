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
{"nif_bbands", 5, ex_bbands, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_beta", 3, ex_beta, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_bop", 4, ex_bop, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cci", 4, ex_cci, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl2_crows", 4, ex_cdl2_crows, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3_black_crows", 4, ex_cdl3_black_crows, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3_inside", 4, ex_cdl3_inside, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3_line_strike", 4, ex_cdl3_line_strike, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3_outside", 4, ex_cdl3_outside, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3_stars_in_south", 4, ex_cdl3_stars_in_south, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl3_white_soldiers", 4, ex_cdl3_white_soldiers, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_abandoned_baby", 5, ex_cdl_abandoned_baby, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_advance_block", 4, ex_cdl_advance_block, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_belt_hold", 4, ex_cdl_belt_hold, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_breakaway", 4, ex_cdl_breakaway, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_closing_marubozu", 4, ex_cdl_closing_marubozu, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_conceal_baby_swallow", 4, ex_cdl_conceal_baby_swallow, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_counterattack", 4, ex_cdl_counterattack, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_dark_cloud_cover", 5, ex_cdl_dark_cloud_cover, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_doji", 4, ex_cdl_doji, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_doji_star", 4, ex_cdl_doji_star, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_dragonfly_doji", 4, ex_cdl_dragonfly_doji, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_engulfing", 4, ex_cdl_engulfing, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_evening_doji_star", 5, ex_cdl_evening_doji_star, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_evening_star", 5, ex_cdl_evening_star, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_gap_side_side_white", 4, ex_cdl_gap_side_side_white, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_gravestone_doji", 4, ex_cdl_gravestone_doji, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_hammer", 4, ex_cdl_hammer, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_hanging_man", 4, ex_cdl_hanging_man, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_harami", 4, ex_cdl_harami, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_harami_cross", 4, ex_cdl_harami_cross, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_highwave", 4, ex_cdl_highwave, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_hikkake", 4, ex_cdl_hikkake, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_hikkake_mod", 4, ex_cdl_hikkake_mod, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_homing_pigeon", 4, ex_cdl_homing_pigeon, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_identical_3_crows", 4, ex_cdl_identical_3_crows, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_inneck", 4, ex_cdl_inneck, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_inverted_hammer", 4, ex_cdl_inverted_hammer, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_kicking", 4, ex_cdl_kicking, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_kicking_by_length", 4, ex_cdl_kicking_by_length, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_ladder_bottom", 4, ex_cdl_ladder_bottom, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_long_legged_doji", 4, ex_cdl_long_legged_doji, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_long_line", 4, ex_cdl_long_line, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_marubozu", 4, ex_cdl_marubozu, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_matching_low", 4, ex_cdl_matching_low, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_mat_hold", 5, ex_cdl_mat_hold, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_morning_doji_star", 5, ex_cdl_morning_doji_star, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_morning_star", 5, ex_cdl_morning_star, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_on_neck", 4, ex_cdl_on_neck, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_piercing", 4, ex_cdl_piercing, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_rickshaw_man", 4, ex_cdl_rickshaw_man, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_rise_fall_3_methods", 4, ex_cdl_rise_fall_3_methods, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_separating_lines", 4, ex_cdl_separating_lines, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_shooting_star", 4, ex_cdl_shooting_star, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_short_line", 4, ex_cdl_short_line, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_spinning_top", 4, ex_cdl_spinning_top, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_stalled_pattern", 4, ex_cdl_stalled_pattern, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_stick_sandwich", 4, ex_cdl_stick_sandwich, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_takuri", 4, ex_cdl_takuri, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_tasuki_gap", 4, ex_cdl_tasuki_gap, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_thrusting", 4, ex_cdl_thrusting, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_tri_star", 4, ex_cdl_tri_star, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_unique_3_river", 4, ex_cdl_unique_3_river, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_upside_gap_2_crows", 4, ex_cdl_upside_gap_2_crows, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_cdl_upside_downside_gap_3_methods", 4, ex_cdl_upside_downside_gap_3_methods, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
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
{"nif_kama", 2, ex_kama, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_linear_reg", 2, ex_linear_reg, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_linear_reg_angle", 2, ex_linear_reg_angle, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_linear_reg_intercept", 2, ex_linear_reg_intercept, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_linear_reg_slope", 2, ex_linear_reg_slope, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ln", 1, ex_ln, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_log10", 1, ex_log10, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_ma", 3, ex_ma, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_macd", 4, ex_macd, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_macdext", 7, ex_macdext, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_macdfix", 2, ex_macdfix, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mama", 3, ex_mama, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mavp", 5, ex_mavp, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_max", 2, ex_max, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_max_index", 2, ex_max_index, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_med_price", 2, ex_med_price, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mfi", 5, ex_mfi, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mid_point", 2, ex_mid_point, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_mid_price", 3, ex_mid_price, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_min", 2, ex_min, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_min_index", 2, ex_min_index, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_min_max", 2, ex_min_max, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
{"nif_min_max_index", 2, ex_min_max_index, ERL_NIF_DIRTY_JOB_CPU_BOUND}, 
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
