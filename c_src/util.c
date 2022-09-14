#include "erl_nif.h"
#include "ta_libc.h"
#include "util.h"
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
    int pos = 0;
    double dp = 0;
    long int ip = 0;
    ERL_NIF_TERM val;
    double *arr = NULL;
    *len = 0;
    enif_get_list_length(env, opts, len);

    if ((*len) == 0)
        return arr;

    arr = (double *)enif_alloc((*len) * sizeof(double));

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
ERL_NIF_TERM
populate_output_int(
    ErlNifEnv *env,
    talib_st *atoms,
    int outBegIdx,
    int inLen,
    int initPos,
    const int *outValues)
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
            outTerms[i] = enif_make_int(env, outValues[i - outBegIdx]);
        }
    }
    return enif_make_list_from_array(env, outTerms, inLen);
}
void load_moving_average_type(ERL_NIF_TERM arg, talib_st *atoms, TA_MAType *type)
{

    if (arg == atoms->atom_ema)
    {
        *type = TA_MAType_EMA;
        return;
    }

    if (arg == atoms->atom_wma)
    {
        *type = TA_MAType_WMA;
        return;
    }

    if (arg == atoms->atom_dema)
    {
        *type = TA_MAType_DEMA;
        return;
    }

    if (arg == atoms->atom_tema)
    {
        *type = TA_MAType_TEMA;
        return;
    }

    if (arg == atoms->atom_trima)
    {
        *type = TA_MAType_TRIMA;
        return;
    }

    if (arg == atoms->atom_kama)
    {
        *type = TA_MAType_KAMA;
        return;
    }

    if (arg == atoms->atom_mama)
    {
        *type = TA_MAType_MAMA;
        return;
    }

    if (arg == atoms->atom_t3)
    {
        *type = TA_MAType_T3;
        return;
    }

    /* the default type is going to be sma */
    *type = TA_MAType_SMA;
}