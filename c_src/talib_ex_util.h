#ifndef TALIBEX_UTIL_H
#define TALIBEX_UTIL_H

#include "erl_nif.h"
#include "ta_libc.h"
#include <stdbool.h>

typedef struct
{
    ERL_NIF_TERM atom_nan;
    ERL_NIF_TERM atom_ok;
    ERL_NIF_TERM atom_error;
    ERL_NIF_TERM atom_open;
    ERL_NIF_TERM atom_high;
    ERL_NIF_TERM atom_low;
    ERL_NIF_TERM atom_close;
    ERL_NIF_TERM atom_volume;
    ERL_NIF_TERM atom_period;

    ERL_NIF_TERM atom_sma;
    ERL_NIF_TERM atom_ema;
    ERL_NIF_TERM atom_wma;
    ERL_NIF_TERM atom_dema;
    ERL_NIF_TERM atom_tema;
    ERL_NIF_TERM atom_trima;
    ERL_NIF_TERM atom_kama;
    ERL_NIF_TERM atom_mama;
    ERL_NIF_TERM atom_t3;

} talib_st;

typedef struct
{
    ErlNifEnv *env;
    talib_st *atoms;
    ERL_NIF_TERM *outTerms;

    double *inOpen;
    double *inHigh;
    double *inLow;
    double *inClose;
    double *inVolume;
    double *inPeriod;

    double *inValues0;
    double *inValues1;

    double *outDblValues0;
    double *outDblValues1;
    double *outDblValues2;
    int *outIntValues0;
    int *outIntValues1;

    unsigned inLen;
    int startIdx;
    int endIdx;
    int optInTimePeriod;
    int outBegIdx;
    int outNBElement;

    double optInDouble;
} TAStruct;

/* TA-Lib functions with one input array only */
typedef TA_RetCode (*TA_FNC_1_IN_ARRAY)(int, int, const double[], int *, int *, double[]);

/* TA-Lib functions with one input array and one indicator specific argument */
typedef TA_RetCode (*TA_FNC_1_IN_ARRAY_1_ARG)(int, int, const double[], int, int *, int *, double[]);

/* TA-Lib functions with one input array and one indicator specific argument, output array of integers */
typedef TA_RetCode (*TA_FNC_1_IN_ARRAY_1_ARG_INT_OUT)(int, int, const double[], int, int *, int *, int[]);

/* TA-Lib functions with two input arrays only */
typedef TA_RetCode (*TA_FNC_2_IN_ARRAYS)(int, int, const double[], const double[], int *, int *, double[]);

/* TA-Lib functions with two input arrays and one indicator specific argument */
typedef TA_RetCode (*TA_FNC_2_IN_ARRAYS_1_ARG)(int, int, const double[], const double[], int, int *, int *, double[]);

/* TA-Lib functions with three input arrays only */
typedef TA_RetCode (*TA_FNC_3_IN_ARRAYS)(int, int, const double[], const double[], const double[], int *, int *, double[]);

/* TA-Lib functions with three input arrays and one indicator specific argument */
typedef TA_RetCode (*TA_FNC_3_IN_ARRAYS_1_ARG)(int, int, const double[], const double[], const double[], int, int *, int *, double[]);

/* TA-Lib functions with four input arrays (Open, High, Low, Close) */
typedef TA_RetCode (*TA_FNC_4_IN_ARRAYS)(int, int, const double[], const double[], const double[], const double[], int *, int *, int[]);

/* TA-Lib functions with four input arrays (Open, High, Low, Close) and one indicator specific argument */
typedef TA_RetCode (*TA_FNC_4_IN_ARRAYS_1_ARG)(int, int, const double[], const double[], const double[], const double[], double, int *, int *, int[]);

/* TA-Lib functions with four input arrays (Open, High, Low, Close), out is double */
typedef TA_RetCode (*TA_FNC_4_IN_ARRAYS_OUT_DOUBLE)(int, int, const double[], const double[], const double[], const double[], int *, int *, double[]);

bool has_bad_arguments(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[]);
int init_input(ErlNifEnv *env, TAStruct *e, ERL_NIF_TERM atom, const ERL_NIF_TERM *array, double **values);
int init_input_arrays(ErlNifEnv *env, ERL_NIF_TERM opts, TAStruct *e);

double
extract_option(ErlNifEnv *env, ERL_NIF_TERM opts, const char *name, double defValue);

ERL_NIF_TERM
extract_atom_option(ErlNifEnv *env, ERL_NIF_TERM opts, ERL_NIF_TERM defValue);

ERL_NIF_TERM
extract_atom_option_by_name(ErlNifEnv *env, ERL_NIF_TERM opts, const char *name, ERL_NIF_TERM defValue);

int eta_init(TAStruct *e, ErlNifEnv *env, const ERL_NIF_TERM argv[]);

void eta_destroy(TAStruct *e);

ERL_NIF_TERM
eta_populate_output_double(TAStruct *e, int initPos, const double *outDblValues);

ERL_NIF_TERM
eta_populate_output_int(TAStruct *e, int initPos, const int *outIntValues);

double *
assign_array(TAStruct *e, ERL_NIF_TERM priceType);

ERL_NIF_TERM
eta_generate_results_double(
    TAStruct *e, TA_RetCode retCode, double *outputValues);

ERL_NIF_TERM
eta_generate_results_int(
    TAStruct *e, TA_RetCode retCode, int *outputValues);

ERL_NIF_TERM
eta_generate_results_three(
    TAStruct *e, TA_RetCode retCode, const char *name0, const char *name1, const char *name2);

ERL_NIF_TERM
eta_generate_results_two(
    TAStruct *e, TA_RetCode retCode, const char *name0, const char *name1);

ERL_NIF_TERM
eta_generate_results_two_int(
    TAStruct *e, TA_RetCode retCode, const char *name0, const char *name1);

int init_function_input_params(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e);

int init_function_input_params_two_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e);

int init_function_input_params_three_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e);

int init_function_input_params_int_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e);

int init_function_input_params_two_in_arrays(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *inArray0, const char *inArray1, TAStruct *e);

int init_function_input_params_with_double_out_array(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e);

int init_function_input_params_with_int_out_array(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e);

int init_function_input_params_two_int_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e);

ERL_NIF_TERM
call_function_with_one_in_array(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TA_FNC_1_IN_ARRAY func);

ERL_NIF_TERM
call_function_with_one_in_array_and_one_argument(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *argumentName, TA_FNC_1_IN_ARRAY_1_ARG func);

ERL_NIF_TERM
call_function_with_one_in_array_and_one_argument_int_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *argumentName, TA_FNC_1_IN_ARRAY_1_ARG_INT_OUT func);
ERL_NIF_TERM
call_function_with_two_in_array(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *arrayName0, const char *arrayName1, TA_FNC_2_IN_ARRAYS func);
ERL_NIF_TERM
call_function_with_two_in_array_and_one_argument(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *arrayName0, const char *arrayName1, const char *argumentName, TA_FNC_2_IN_ARRAYS_1_ARG func);

ERL_NIF_TERM
call_function_with_three_in_arrays(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TA_FNC_3_IN_ARRAYS func);

ERL_NIF_TERM
call_function_with_three_in_arrays_and_one_argument(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *argumentName, TA_FNC_3_IN_ARRAYS_1_ARG func);

ERL_NIF_TERM
call_function_with_four_in_arrays(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TA_FNC_4_IN_ARRAYS func);

ERL_NIF_TERM
call_function_with_four_in_arrays_and_one_argument(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *argumentName, TA_FNC_4_IN_ARRAYS_1_ARG func);

ERL_NIF_TERM
call_function_with_four_in_arrays_out_double(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TA_FNC_4_IN_ARRAYS_OUT_DOUBLE func);

int extract_ma_type_option(ErlNifEnv *env, TAStruct *e, ERL_NIF_TERM opts, const char *name, int defValue);
#endif