#include "erl_nif.h"
#include "ta_libc.h"
#include "talib_ex_util.h"
#include <stdbool.h>

ERL_NIF_TERM make_atom(ErlNifEnv *env, const char *name)
{
    ERL_NIF_TERM ret;
    if (enif_make_existing_atom(env, name, &ret, ERL_NIF_LATIN1))
    {
        return ret;
    }
    return enif_make_atom(env, name);
}

double *
construct_array_from_list(ErlNifEnv *env, ERL_NIF_TERM opts, unsigned *len)
{
    double *arr = NULL;
    *len = 0;
    enif_get_list_length(env, opts, len);

    if ((*len) == 0)
        return arr;

    arr = (double *)enif_alloc((*len) * sizeof(double));

    int pos = 0;
    double dp = 0;
    long int ip = 0;
    ERL_NIF_TERM val;

    while (enif_get_list_cell(env, opts, &val, &opts))
    {
        if (enif_is_number(env, val))
        {
            if (enif_get_double(env, val, &dp))
                arr[pos] = dp;
            else if (enif_get_long(env, val, &ip))
                arr[pos] = ip;
        }
        else
        {
            arr[pos] = 0;
        }

        pos++;
    }

    return arr;
}

ERL_NIF_TERM
populate_output_double(
    ErlNifEnv *env,
    talib_st *atoms,
    int outBegIdx,
    int inLen,
    int initPos,
    const double *outValues)
{
    ERL_NIF_TERM *outTerms[inLen];
    int i;
    for (i = initPos; i < inLen; i++)
    {
        if (i < outBegIdx)
        {
            outTerms[i] = atoms->atom_nan;
        }
        else
        {
            outTerms[i] = enif_make_double(env, outValues[i - outBegIdx]);
        }
    }
    return enif_make_list_from_array(env, outTerms, inLen);
}