#ifndef TALIBEX_UTIL2_H
#define TALIBEX_UTIL2_H

#include "erl_nif.h"
#include "ta_libc.h"
#include <stdbool.h>

typedef struct
{
    ERL_NIF_TERM atom_nan;
    ERL_NIF_TERM atom_ok;
    ERL_NIF_TERM atom_error;
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

ERL_NIF_TERM make_atom(ErlNifEnv *env, const char *name);
double *
construct_array_from_list(ErlNifEnv *env, ERL_NIF_TERM opts, unsigned *len);

ERL_NIF_TERM
populate_output_double(
    ErlNifEnv *env,
    talib_st *atoms,
    int outBegIdx,
    int inLen,
    int initPos,
    const double *outDblValues);

ERL_NIF_TERM
populate_output_int(
    ErlNifEnv *env,
    talib_st *atoms,
    int outBegIdx,
    int inLen,
    int initPos,
    const int *outDblValues);

void load_moving_average_type(ERL_NIF_TERM arg, talib_st *atoms, TA_MAType *type);
#endif
