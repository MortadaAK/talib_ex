#ifndef TALIBEX_UTIL2_H
#define TALIBEX_UTIL2_H

#include "erl_nif.h"
#include "ta_libc.h"
#include "talib_ex_util.h"
#include <stdbool.h>

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
#endif