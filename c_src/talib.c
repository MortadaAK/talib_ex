#include "erl_nif.h"
#include "talib.h"
#include "ta_abstract.h"
#include "ta_common.h"
#include "ta_defs.h"
#include "ta_func.h"
#include "ta_libc.h"
#include <stdbool.h>

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

ERL_NIF_TERM make_atom(ErlNifEnv *env, const char *name)
{
    ERL_NIF_TERM ret;
    if (enif_make_existing_atom(env, name, &ret, ERL_NIF_LATIN1))
    {
        return ret;
    }
    return enif_make_atom(env, name);
}

bool has_bad_arguments(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    if (argc != 2)
    {
        return true;
    }

    if (!enif_is_list(env, argv[0]))
    {
        return true;
    }

    if (!enif_is_list(env, argv[1]))
    {
        return true;
    }

    return false;
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

int init_input(ErlNifEnv *env, TAStruct *e, ERL_NIF_TERM atom, const ERL_NIF_TERM *array, double **values)
{
    if (enif_compare(atom, array[0]) == 0 && enif_is_list(env, array[1]))
    { /* tuple contains Open prices */
        unsigned tmpLen = 0;
        *values = construct_array_from_list(env, array[1], &tmpLen);

        if (e->inLen != tmpLen && e->inLen != 0)
        {
            return -1; /* we have a problem input arrays are of different size */
        }

        e->inLen = tmpLen;
        e->endIdx = tmpLen - 1;
        return 1; /* input tuple matching input atom/key */
    }

    return 0; /* input not matching */
}

int init_input_arrays(ErlNifEnv *env, ERL_NIF_TERM opts, TAStruct *e)
{
    int result = 0;
    unsigned len = 0;
    enif_get_list_length(env, opts, &len);

    if (len == 0)
        return -1;

    ERL_NIF_TERM val;
    int arity;
    const ERL_NIF_TERM *array;

    while (enif_get_list_cell(env, opts, &val, &opts))
    {
        if (!enif_is_tuple(env, val))
            continue; /* skip no tuple records */

        /* is tupple e.g. {key, value} */
        if (!enif_get_tuple(env, val, &arity, &array))
            continue;

        if (arity != 2)
            continue;

        /* Open */
        result = init_input(env, e, e->atoms->atom_open, array, &(e->inOpen));
        if (result == -1)
            return -1;

        if (result == 1)
            continue; /* tuple is Open */

        /* High */
        result = init_input(env, e, e->atoms->atom_high, array, &(e->inHigh));
        if (result == -1)
            return -1;

        if (result == 1)
            continue; /* tuple is High */

        /* Low */
        result = init_input(env, e, e->atoms->atom_low, array, &(e->inLow));
        if (result == -1)
            return -1;

        if (result == 1)
            continue; /* tuple is Low */

        /* Close */
        result = init_input(env, e, e->atoms->atom_close, array, &(e->inClose));
        if (result == -1)
            return -1;

        if (result == 1)
            continue; /* tuple is Close */

        /* Volume */
        result = init_input(env, e, e->atoms->atom_volume, array, &(e->inVolume));
        if (result == -1)
            return -1;

        if (result == 1)
            continue; /* tuple is Volume */

        /* Period */
        result = init_input(env, e, e->atoms->atom_period, array, &(e->inPeriod));
        if (result == -1)
            return -1;
    }

    return 1;
}

double
extract_option(ErlNifEnv *env, ERL_NIF_TERM opts, const char *name, double defValue)
{
    double res = defValue;
    int arity;
    double dp = 0;
    long int ip = 0;
    const ERL_NIF_TERM *array;
    ERL_NIF_TERM atom_name = make_atom(env, name);

    ERL_NIF_TERM val;

    while (enif_get_list_cell(env, opts, &val, &opts))
    {
        if (!enif_is_tuple(env, val))
            continue;

        if (!enif_get_tuple(env, val, &arity, &array))
            continue;

        if (arity != 2)
            continue;

        if (enif_compare(atom_name, array[0]) != 0)
            continue;

        if (!enif_is_number(env, array[1]))
            continue;

        if (enif_get_double(env, array[1], &dp))
            res = dp;
        else if (enif_get_long(env, array[1], &ip))
            res = ip;
    }

    return res;
}

ERL_NIF_TERM
extract_atom_option(ErlNifEnv *env, ERL_NIF_TERM opts, ERL_NIF_TERM defValue)
{
    ERL_NIF_TERM val;
    ERL_NIF_TERM res = defValue;
    while (enif_get_list_cell(env, opts, &val, &opts))
    {
        if (enif_is_atom(env, val))
            return val; /* found the first atom value in the list */
    }

    return res;
}

ERL_NIF_TERM
extract_atom_option_by_name(ErlNifEnv *env, ERL_NIF_TERM opts, const char *name, ERL_NIF_TERM defValue)
{
    ERL_NIF_TERM res = defValue;
    int arity;
    unsigned len;
    const ERL_NIF_TERM *array;
    ERL_NIF_TERM atom_name = make_atom(env, name);
    ERL_NIF_TERM val;

    while (enif_get_list_cell(env, opts, &val, &opts))
    {
        if (!enif_is_tuple(env, val))
            continue;

        if (!enif_get_tuple(env, val, &arity, &array))
            continue;

        if (arity != 2)
            continue;

        if (enif_compare(atom_name, array[0]) != 0)
            continue;

        if (!enif_is_atom(env, array[1]))
            continue;

        if (!enif_get_atom_length(env, array[1], &len, ERL_NIF_LATIN1))
            continue;

        /* init array */
        char *buf = (char *)enif_alloc(len * sizeof(char));
        if (!enif_get_atom(env, array[1], buf, len, ERL_NIF_LATIN1))
        {
            enif_free(buf);
            continue;
        }

        res = make_atom(env, buf);
        enif_free(buf);
        return res;
    }

    return res;
}

int eta_init(TAStruct *e, ErlNifEnv *env, const ERL_NIF_TERM argv[])
{
    e->env = env;
    e->atoms = enif_priv_data(env);
    e->inOpen = NULL;
    e->inHigh = NULL;
    e->inLow = NULL;
    e->inClose = NULL;
    e->inVolume = NULL;
    e->inPeriod = NULL;

    e->inValues0 = NULL;
    e->inValues1 = NULL;

    e->outDblValues0 = NULL;
    e->outDblValues1 = NULL;
    e->outDblValues2 = NULL;
    e->outIntValues0 = NULL;
    e->outIntValues1 = NULL;

    e->outTerms = NULL;
    e->inLen = 0;
    e->startIdx = 0;
    e->endIdx = 0;
    e->optInTimePeriod = 0;
    e->outBegIdx = 0;
    e->outNBElement = 0;
    e->optInDouble = 0;

    return init_input_arrays(env, argv[0], e);
}

void eta_destroy(TAStruct *e)
{
    if (e->inOpen != NULL)
    {
        enif_free(e->inOpen);
        e->inOpen = NULL;
    }

    if (e->inHigh != NULL)
    {
        enif_free(e->inHigh);
        e->inHigh = NULL;
    }

    if (e->inLow != NULL)
    {
        enif_free(e->inLow);
        e->inLow = NULL;
    }

    if (e->inClose != NULL)
    {
        enif_free(e->inClose);
        e->inClose = NULL;
    }

    if (e->inVolume != NULL)
    {
        enif_free(e->inVolume);
        e->inVolume = NULL;
    }

    if (e->inPeriod != NULL)
    {
        enif_free(e->inPeriod);
        e->inPeriod = NULL;
    }

    if (e->outDblValues0 != NULL)
    {
        enif_free(e->outDblValues0);
        e->outDblValues0 = NULL;
    }

    if (e->outDblValues1 != NULL)
    {
        enif_free(e->outDblValues1);
        e->outDblValues1 = NULL;
    }

    if (e->outDblValues2 != NULL)
    {
        enif_free(e->outDblValues2);
        e->outDblValues2 = NULL;
    }

    if (e->outIntValues0 != NULL)
    {
        enif_free(e->outIntValues0);
        e->outIntValues0 = NULL;
    }

    if (e->outIntValues1 != NULL)
    {
        enif_free(e->outIntValues1);
        e->outIntValues1 = NULL;
    }

    if (e->outTerms != NULL)
    {
        enif_free(e->outTerms);
        e->outTerms = NULL;
    }
}

ERL_NIF_TERM
eta_populate_output_double(TAStruct *e, int initPos, const double *outDblValues)
{
    int i;
    for (i = initPos; i < e->inLen; i++)
    {
        if (i < e->outBegIdx)
        {
            e->outTerms[i] = e->atoms->atom_nan;
        }
        else
        {
            e->outTerms[i] = enif_make_double(e->env, outDblValues[i - e->outBegIdx]);
        }
    }
    return enif_make_list_from_array(e->env, e->outTerms, e->inLen);
}

ERL_NIF_TERM
eta_populate_output_int(TAStruct *e, int initPos, const int *outIntValues)
{
    int i;
    for (i = initPos; i < e->inLen; i++)
    {
        if (i < e->outBegIdx)
        {
            e->outTerms[i] = e->atoms->atom_nan;
        }
        else
        {
            e->outTerms[i] = enif_make_int(e->env, outIntValues[i - e->outBegIdx]);
        }
    }
    return enif_make_list_from_array(e->env, e->outTerms, e->inLen);
}

double *
assign_array(TAStruct *e, ERL_NIF_TERM priceType)
{
    if (enif_compare(priceType, e->atoms->atom_open) == 0)
        return e->inOpen;

    if (enif_compare(priceType, e->atoms->atom_high) == 0)
        return e->inHigh;

    if (enif_compare(priceType, e->atoms->atom_low) == 0)
        return e->inLow;

    if (enif_compare(priceType, e->atoms->atom_close) == 0)
        return e->inClose;

    if (enif_compare(priceType, e->atoms->atom_volume) == 0)
        return e->inVolume;

    if (enif_compare(priceType, e->atoms->atom_period) == 0)
        return e->inPeriod;

    return NULL;
}

ERL_NIF_TERM
eta_generate_results_double(
    TAStruct *e, TA_RetCode retCode, double *outputValues)
{
    /* check for sucess */
    if (retCode != TA_SUCCESS)
    {
        /* generate error message */
        TA_RetCodeInfo info;
        TA_SetRetCodeInfo(retCode, &info);
        return enif_make_tuple2(e->env, e->atoms->atom_error, enif_make_string(e->env, info.infoStr, ERL_NIF_LATIN1));
    }

    /* generate the output structure */
    return enif_make_tuple2(e->env, e->atoms->atom_ok, eta_populate_output_double(e, 0, outputValues));
}

ERL_NIF_TERM
eta_generate_results_int(
    TAStruct *e, TA_RetCode retCode, int *outputValues)
{
    /* check for sucess */
    if (retCode != TA_SUCCESS)
    {
        /* generate error message */
        TA_RetCodeInfo info;
        TA_SetRetCodeInfo(retCode, &info);
        return enif_make_tuple2(e->env, e->atoms->atom_error, enif_make_string(e->env, info.infoStr, ERL_NIF_LATIN1));
    }

    /* generate the output structure */
    return enif_make_tuple2(e->env, e->atoms->atom_ok, eta_populate_output_int(e, 0, outputValues));
}

ERL_NIF_TERM
eta_generate_results_three(
    TAStruct *e, TA_RetCode retCode, const char *name0, const char *name1, const char *name2)
{
    /* check for sucess */
    if (retCode != TA_SUCCESS)
    {
        /* generate error message */
        TA_RetCodeInfo info;
        TA_SetRetCodeInfo(retCode, &info);
        return enif_make_tuple2(e->env, e->atoms->atom_error, enif_make_string(e->env, info.infoStr, ERL_NIF_LATIN1));
    }

    /* generate the output structure */
    ERL_NIF_TERM results[3];

    results[0] = enif_make_tuple2(e->env, make_atom(e->env, name0), eta_populate_output_double(e, 0, e->outDblValues0));
    results[1] = enif_make_tuple2(e->env, make_atom(e->env, name1), eta_populate_output_double(e, 0, e->outDblValues1));
    results[2] = enif_make_tuple2(e->env, make_atom(e->env, name2), eta_populate_output_double(e, 0, e->outDblValues2));

    return enif_make_list_from_array(e->env, results, 3);
}

ERL_NIF_TERM
eta_generate_results_two(
    TAStruct *e, TA_RetCode retCode, const char *name0, const char *name1)
{
    /* check for sucess */
    if (retCode != TA_SUCCESS)
    {
        /* generate error message */
        TA_RetCodeInfo info;
        TA_SetRetCodeInfo(retCode, &info);
        return enif_make_tuple2(e->env, e->atoms->atom_error, enif_make_string(e->env, info.infoStr, ERL_NIF_LATIN1));
    }

    /* generate the output structure */
    ERL_NIF_TERM results[2];

    results[0] = enif_make_tuple2(e->env, make_atom(e->env, name0), eta_populate_output_double(e, 0, e->outDblValues0));
    results[1] = enif_make_tuple2(e->env, make_atom(e->env, name1), eta_populate_output_double(e, 0, e->outDblValues1));

    return enif_make_list_from_array(e->env, results, 2);
}

ERL_NIF_TERM
eta_generate_results_two_int(
    TAStruct *e, TA_RetCode retCode, const char *name0, const char *name1)
{
    /* check for sucess */
    if (retCode != TA_SUCCESS)
    {
        /* generate error message */
        TA_RetCodeInfo info;
        TA_SetRetCodeInfo(retCode, &info);
        return enif_make_tuple2(e->env, e->atoms->atom_error, enif_make_string(e->env, info.infoStr, ERL_NIF_LATIN1));
    }

    /* generate the output structure */
    ERL_NIF_TERM results[2];

    results[0] = enif_make_tuple2(e->env, make_atom(e->env, name0), eta_populate_output_int(e, 0, e->outIntValues0));
    results[1] = enif_make_tuple2(e->env, make_atom(e->env, name1), eta_populate_output_int(e, 0, e->outIntValues1));

    return enif_make_list_from_array(e->env, results, 2);
}

int init_function_input_params(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e)
{
    /* check if valid arguments */
    if (has_bad_arguments(env, argc, argv))
        return 1;

    /* initialise the TAStruct, extract the inValues */
    if (eta_init(e, env, argv) != 1)
        return 1;

    /* extract option values */
    ERL_NIF_TERM priceType = extract_atom_option(env, argv[1], e->atoms->atom_close); /* by default work on close */
    e->inValues0 = assign_array(e, priceType);
    if (e->inValues0 == NULL)
        return 1;

    e->outDblValues0 = (double *)enif_alloc((e->inLen) * sizeof(double));
    e->outTerms = (ERL_NIF_TERM *)enif_alloc((e->inLen) * sizeof(ERL_NIF_TERM));

    return 0;
}

int init_function_input_params_two_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e)
{
    /* check if valid arguments */
    if (has_bad_arguments(env, argc, argv))
        return 1;

    /* initialise the TAStruct, extract the inValues */
    if (eta_init(e, env, argv) != 1)
        return 1;

    /* extract option values */
    ERL_NIF_TERM priceType = extract_atom_option(env, argv[1], e->atoms->atom_close); /* by default work on close */
    e->inValues0 = assign_array(e, priceType);
    if (e->inValues0 == NULL)
        return 1;

    e->outDblValues0 = (double *)enif_alloc((e->inLen) * sizeof(double));
    e->outDblValues1 = (double *)enif_alloc((e->inLen) * sizeof(double));

    e->outTerms = (ERL_NIF_TERM *)enif_alloc((e->inLen) * sizeof(ERL_NIF_TERM));

    return 0;
}

int init_function_input_params_three_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e)
{
    /* check if valid arguments */
    if (has_bad_arguments(env, argc, argv))
        return 1;

    /* initialise the TAStruct, extract the inValues */
    if (eta_init(e, env, argv) != 1)
        return 1;

    /* extract option values */
    ERL_NIF_TERM priceType = extract_atom_option(env, argv[1], e->atoms->atom_close); /* by default work on close */
    e->inValues0 = assign_array(e, priceType);
    if (e->inValues0 == NULL)
        return 1;

    e->outDblValues0 = (double *)enif_alloc((e->inLen) * sizeof(double));
    e->outDblValues1 = (double *)enif_alloc((e->inLen) * sizeof(double));
    e->outDblValues2 = (double *)enif_alloc((e->inLen) * sizeof(double));

    e->outTerms = (ERL_NIF_TERM *)enif_alloc((e->inLen) * sizeof(ERL_NIF_TERM));

    return 0;
}

int init_function_input_params_int_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e)
{
    /* check if valid arguments */
    if (has_bad_arguments(env, argc, argv))
        return 1;

    /* initialise the TAStruct, extract the inValues */
    if (eta_init(e, env, argv) != 1)
        return 1;

    /* extract option values */
    ERL_NIF_TERM priceType = extract_atom_option(env, argv[1], e->atoms->atom_close); /* by default work on close */
    e->inValues0 = assign_array(e, priceType);
    if (e->inValues0 == NULL)
        return 1;

    e->outIntValues0 = (int *)enif_alloc((e->inLen) * sizeof(double));
    e->outTerms = (ERL_NIF_TERM *)enif_alloc((e->inLen) * sizeof(ERL_NIF_TERM));

    return 0;
}

int init_function_input_params_two_in_arrays(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *inArray0, const char *inArray1, TAStruct *e)
{
    /* check if valid arguments */
    if (has_bad_arguments(env, argc, argv))
        return 1;

    /* initialise the TAStruct, extract the inValues */
    if (eta_init(e, env, argv) != 1)
        return 1;

    /* extract option values */
    ERL_NIF_TERM priceType0 = extract_atom_option_by_name(env, argv[1], inArray0, e->atoms->atom_high); /* by default work on High */

    e->inValues0 = assign_array(e, priceType0);
    if (e->inValues0 == NULL)
        return 1;

    ERL_NIF_TERM priceType1 = extract_atom_option_by_name(env, argv[1], inArray1, e->atoms->atom_low); /* by default work on Low */

    e->inValues1 = assign_array(e, priceType1);
    if (e->inValues1 == NULL)
        return 1;

    e->outDblValues0 = (double *)enif_alloc((e->inLen) * sizeof(double));
    e->outTerms = (ERL_NIF_TERM *)enif_alloc((e->inLen) * sizeof(ERL_NIF_TERM));

    return 0;
}

int init_function_input_params_with_double_out_array(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e)
{
    /* check if valid arguments */
    if (has_bad_arguments(env, argc, argv))
        return 1;

    /* initialise the TAStruct, extract the inValues */
    if (eta_init(e, env, argv) != 1)
        return 1;

    e->outDblValues0 = (double *)enif_alloc((e->inLen) * sizeof(double));
    e->outTerms = (ERL_NIF_TERM *)enif_alloc((e->inLen) * sizeof(ERL_NIF_TERM));

    return 0;
}

int init_function_input_params_with_int_out_array(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e)
{
    /* check if valid arguments */
    if (has_bad_arguments(env, argc, argv))
        return 1;

    /* initialise the TAStruct, extract the inValues */
    if (eta_init(e, env, argv) != 1)
        return 1;

    e->outIntValues0 = (int *)enif_alloc((e->inLen) * sizeof(double));
    e->outTerms = (ERL_NIF_TERM *)enif_alloc((e->inLen) * sizeof(ERL_NIF_TERM));

    return 0;
}

int init_function_input_params_two_int_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TAStruct *e)
{
    /* check if valid arguments */
    if (has_bad_arguments(env, argc, argv))
        return 1;

    /* initialise the TAStruct, extract the inValues */
    if (eta_init(e, env, argv) != 1)
        return 1;

    /* extract option values */
    ERL_NIF_TERM priceType = extract_atom_option(env, argv[1], e->atoms->atom_close); /* by default work on close */
    e->inValues0 = assign_array(e, priceType);
    if (e->inValues0 == NULL)
        return 1;

    e->outIntValues0 = (int *)enif_alloc((e->inLen) * sizeof(double));
    e->outIntValues1 = (int *)enif_alloc((e->inLen) * sizeof(double));
    e->outTerms = (ERL_NIF_TERM *)enif_alloc((e->inLen) * sizeof(ERL_NIF_TERM));

    return 0;
}

ERL_NIF_TERM
call_function_with_one_in_array(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TA_FNC_1_IN_ARRAY func)
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
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inValues0,
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
call_function_with_one_in_array_and_one_argument(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *argumentName, TA_FNC_1_IN_ARRAY_1_ARG func)
{
    /* declare the variables */
    TAStruct eta;
    TAStruct *e = &eta;

    if (init_function_input_params(env, argc, argv, e) == 1)
    { /* something wrong with input arguments, clean up and return bad argument error */
        eta_destroy(e);
        return enif_make_badarg(env);
    }

    e->optInTimePeriod = (int)extract_option(env, argv[1], argumentName, 2);

    /* call TA-Lib function */
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inValues0,
        e->optInTimePeriod,
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
call_function_with_one_in_array_and_one_argument_int_out(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *argumentName, TA_FNC_1_IN_ARRAY_1_ARG_INT_OUT func)
{
    /* declare the variables */
    TAStruct eta;
    TAStruct *e = &eta;

    if (init_function_input_params_int_out(env, argc, argv, e) == 1)
    { /* something wrong with input arguments, clean up and return bad argument error */
        eta_destroy(e);
        return enif_make_badarg(env);
    }

    e->optInTimePeriod = (int)extract_option(env, argv[1], argumentName, 2);

    /* call TA-Lib function */
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inValues0,
        e->optInTimePeriod,
        &e->outBegIdx,
        &e->outNBElement,
        &e->outIntValues0[0]);

    /* generate results */
    ERL_NIF_TERM results = eta_generate_results_int(e, retCode, e->outIntValues0);

    /* clean up */
    eta_destroy(e);

    /* return the results; */
    return results;
}

ERL_NIF_TERM
call_function_with_two_in_array(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *arrayName0, const char *arrayName1, TA_FNC_2_IN_ARRAYS func)
{
    /* declare the variables */
    TAStruct eta;
    TAStruct *e = &eta;

    if (init_function_input_params_two_in_arrays(env, argc, argv, arrayName0, arrayName1, e) == 1)
    { /* something wrong with input arguments, clean up and return bad argument error */
        eta_destroy(e);
        return enif_make_badarg(env);
    }

    /* call TA-Lib function */
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inValues0,
        e->inValues1,
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
call_function_with_two_in_array_and_one_argument(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *arrayName0, const char *arrayName1, const char *argumentName, TA_FNC_2_IN_ARRAYS_1_ARG func)
{
    /* declare the variables */
    TAStruct eta;
    TAStruct *e = &eta;

    if (init_function_input_params_two_in_arrays(env, argc, argv, arrayName0, arrayName1, e) == 1)
    { /* something wrong with input arguments, clean up and return bad argument error */
        eta_destroy(e);
        return enif_make_badarg(env);
    }

    e->optInTimePeriod = (int)extract_option(env, argv[1], argumentName, 2);

    /* call TA-Lib function */
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inValues0,
        e->inValues1,
        e->optInTimePeriod,
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
call_function_with_three_in_arrays(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TA_FNC_3_IN_ARRAYS func)
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
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inHigh,
        e->inLow,
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
call_function_with_three_in_arrays_and_one_argument(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *argumentName, TA_FNC_3_IN_ARRAYS_1_ARG func)
{
    /* declare the variables */
    TAStruct eta;
    TAStruct *e = &eta;

    if (init_function_input_params_with_double_out_array(env, argc, argv, e) == 1)
    { /* something wrong with input arguments, clean up and return bad argument error */
        eta_destroy(e);
        return enif_make_badarg(env);
    }

    e->optInTimePeriod = (int)extract_option(env, argv[1], argumentName, 2);

    /* call TA-Lib function */
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inHigh,
        e->inLow,
        e->inClose,
        e->optInTimePeriod,
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
call_function_with_four_in_arrays(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TA_FNC_4_IN_ARRAYS func)
{
    /* declare the variables */
    TAStruct eta;
    TAStruct *e = &eta;

    if (init_function_input_params_with_int_out_array(env, argc, argv, e) == 1)
    { /* something wrong with input arguments, clean up and return bad argument error */
        eta_destroy(e);
        return enif_make_badarg(env);
    }

    /* call TA-Lib function */
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inOpen,
        e->inHigh,
        e->inLow,
        e->inClose,
        &e->outBegIdx,
        &e->outNBElement,
        &e->outIntValues0[0]);

    /* generate results */
    ERL_NIF_TERM results = eta_generate_results_int(e, retCode, e->outIntValues0);

    /* clean up */
    eta_destroy(e);

    /* return the results; */
    return results;
}

ERL_NIF_TERM
call_function_with_four_in_arrays_and_one_argument(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], const char *argumentName, TA_FNC_4_IN_ARRAYS_1_ARG func)
{
    /* declare the variables */
    TAStruct eta;
    TAStruct *e = &eta;

    if (init_function_input_params_with_int_out_array(env, argc, argv, e) == 1)
    { /* something wrong with input arguments, clean up and return bad argument error */
        eta_destroy(e);
        return enif_make_badarg(env);
    }

    e->optInDouble = extract_option(env, argv[1], argumentName, 0);

    /* call TA-Lib function */
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inOpen,
        e->inHigh,
        e->inLow,
        e->inClose,
        e->optInDouble,
        &e->outBegIdx,
        &e->outNBElement,
        &e->outIntValues0[0]);

    /* generate results */
    ERL_NIF_TERM results = eta_generate_results_int(e, retCode, e->outIntValues0);

    /* clean up */
    eta_destroy(e);

    /* return the results; */
    return results;
}

ERL_NIF_TERM
call_function_with_four_in_arrays_out_double(
    ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[], TA_FNC_4_IN_ARRAYS_OUT_DOUBLE func)
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
    TA_RetCode retCode = func(
        e->startIdx,
        e->endIdx,
        e->inOpen,
        e->inHigh,
        e->inLow,
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

int extract_ma_type_option(ErlNifEnv *env, TAStruct *e, ERL_NIF_TERM opts, const char *name, int defValue)
{
    int res = defValue;
    int arity;
    const ERL_NIF_TERM *array;
    ERL_NIF_TERM atom_name = make_atom(env, name);

    ERL_NIF_TERM val;

    while (enif_get_list_cell(env, opts, &val, &opts))
    {
        if (!enif_is_tuple(env, val))
            continue;

        if (!enif_get_tuple(env, val, &arity, &array))
            continue;

        if (arity != 2)
            continue;

        if (enif_compare(atom_name, array[0]) != 0)
            continue;

        if (!enif_is_atom(env, array[1]))
            continue;

        if (enif_compare(array[1], e->atoms->atom_sma) == 0)
            return 0;

        if (enif_compare(array[1], e->atoms->atom_ema) == 0)
            return 1;

        if (enif_compare(array[1], e->atoms->atom_wma) == 0)
            return 2;

        if (enif_compare(array[1], e->atoms->atom_dema) == 0)
            return 3;

        if (enif_compare(array[1], e->atoms->atom_tema) == 0)
            return 4;

        if (enif_compare(array[1], e->atoms->atom_trima) == 0)
            return 5;

        if (enif_compare(array[1], e->atoms->atom_kama) == 0)
            return 6;

        if (enif_compare(array[1], e->atoms->atom_mama) == 0)
            return 7;

        if (enif_compare(array[1], e->atoms->atom_t3) == 0)
            return 8;
    }

    return res;
}

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
static ERL_NIF_TERM
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
static ERL_NIF_TERM
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
static ERL_NIF_TERM
ex_ADD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    return call_function_with_two_in_array(env, argc, argv, "high", "low", &TA_ADD);
}
static ERL_NIF_TERM
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
static ERL_NIF_TERM
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
static ERL_NIF_TERM
ex_ADXR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ADXR
}
static ERL_NIF_TERM
ex_APO(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_APO
}
static ERL_NIF_TERM
ex_AROON(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_AROON
}
static ERL_NIF_TERM
ex_AROONOSC(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_AROONOSC
}
static ERL_NIF_TERM
ex_ASIN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ASIN
}
static ERL_NIF_TERM
ex_ATAN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ATAN
}
static ERL_NIF_TERM
ex_ATR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ATR
}
static ERL_NIF_TERM
ex_AVGPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_AVGPRICE
}
static ERL_NIF_TERM
ex_BBANDS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_BBANDS
}
static ERL_NIF_TERM
ex_BETA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_BETA
}
static ERL_NIF_TERM
ex_BOP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_BOP
}
static ERL_NIF_TERM
ex_CCI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CCI
}
static ERL_NIF_TERM
ex_CDL2CROWS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL2CROWS
}
static ERL_NIF_TERM
ex_CDL3BLACKCROWS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3BLACKCROWS
}
static ERL_NIF_TERM
ex_CDL3INSIDE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3INSIDE
}
static ERL_NIF_TERM
ex_CDL3LINESTRIKE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3LINESTRIKE
}
static ERL_NIF_TERM
ex_CDL3OUTSIDE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3OUTSIDE
}
static ERL_NIF_TERM
ex_CDL3STARSINSOUTH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3STARSINSOUTH
}
static ERL_NIF_TERM
ex_CDL3WHITESOLDIERS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDL3WHITESOLDIERS
}
static ERL_NIF_TERM
ex_CDLABANDONEDBABY(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLABANDONEDBABY
}
static ERL_NIF_TERM
ex_CDLADVANCEBLOCK(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLADVANCEBLOCK
}
static ERL_NIF_TERM
ex_CDLBELTHOLD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLBELTHOLD
}
static ERL_NIF_TERM
ex_CDLBREAKAWAY(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLBREAKAWAY
}
static ERL_NIF_TERM
ex_CDLCLOSINGMARUBOZU(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLCLOSINGMARUBOZU
}
static ERL_NIF_TERM
ex_CDLCONCEALBABYSWALL(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLCONCEALBABYSWALL
}
static ERL_NIF_TERM
ex_CDLCOUNTERATTACK(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLCOUNTERATTACK
}
static ERL_NIF_TERM
ex_CDLDARKCLOUDCOVER(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLDARKCLOUDCOVER
}
static ERL_NIF_TERM
ex_CDLDOJI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLDOJI
}
static ERL_NIF_TERM
ex_CDLDOJISTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLDOJISTAR
}
static ERL_NIF_TERM
ex_CDLDRAGONFLYDOJI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLDRAGONFLYDOJI
}
static ERL_NIF_TERM
ex_CDLENGULFING(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLENGULFING
}
static ERL_NIF_TERM
ex_CDLEVENINGDOJISTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLEVENINGDOJISTAR
}
static ERL_NIF_TERM
ex_CDLEVENINGSTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLEVENINGSTAR
}
static ERL_NIF_TERM
ex_CDLGAPSIDESIDEWHITE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLGAPSIDESIDEWHITE
}
static ERL_NIF_TERM
ex_CDLGRAVESTONEDOJI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLGRAVESTONEDOJI
}
static ERL_NIF_TERM
ex_CDLHAMMER(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHAMMER
}
static ERL_NIF_TERM
ex_CDLHANGINGMAN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHANGINGMAN
}
static ERL_NIF_TERM
ex_CDLHARAMI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHARAMI
}
static ERL_NIF_TERM
ex_CDLHARAMICROSS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHARAMICROSS
}
static ERL_NIF_TERM
ex_CDLHIGHWAVE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHIGHWAVE
}
static ERL_NIF_TERM
ex_CDLHIKKAKE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHIKKAKE
}
static ERL_NIF_TERM
ex_CDLHIKKAKEMOD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHIKKAKEMOD
}
static ERL_NIF_TERM
ex_CDLHOMINGPIGEON(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLHOMINGPIGEON
}
static ERL_NIF_TERM
ex_CDLIDENTICAL3CROWS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLIDENTICAL3CROWS
}
static ERL_NIF_TERM
ex_CDLINNECK(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLINNECK
}
static ERL_NIF_TERM
ex_CDLINVERTEDHAMMER(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLINVERTEDHAMMER
}
static ERL_NIF_TERM
ex_CDLKICKING(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLKICKING
}
static ERL_NIF_TERM
ex_CDLKICKINGBYLENGTH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLKICKINGBYLENGTH
}
static ERL_NIF_TERM
ex_CDLLADDERBOTTOM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLLADDERBOTTOM
}
static ERL_NIF_TERM
ex_CDLLONGLEGGEDDOJI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLLONGLEGGEDDOJI
}
static ERL_NIF_TERM
ex_CDLLONGLINE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLLONGLINE
}
static ERL_NIF_TERM
ex_CDLMARUBOZU(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMARUBOZU
}
static ERL_NIF_TERM
ex_CDLMATCHINGLOW(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMATCHINGLOW
}
static ERL_NIF_TERM
ex_CDLMATHOLD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMATHOLD
}
static ERL_NIF_TERM
ex_CDLMORNINGDOJISTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMORNINGDOJISTAR
}
static ERL_NIF_TERM
ex_CDLMORNINGSTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLMORNINGSTAR
}
static ERL_NIF_TERM
ex_CDLONNECK(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLONNECK
}
static ERL_NIF_TERM
ex_CDLPIERCING(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLPIERCING
}
static ERL_NIF_TERM
ex_CDLRICKSHAWMAN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLRICKSHAWMAN
}
static ERL_NIF_TERM
ex_CDLRISEFALL3METHODS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLRISEFALL3METHODS
}
static ERL_NIF_TERM
ex_CDLSEPARATINGLINES(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSEPARATINGLINES
}
static ERL_NIF_TERM
ex_CDLSHOOTINGSTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSHOOTINGSTAR
}
static ERL_NIF_TERM
ex_CDLSHORTLINE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSHORTLINE
}
static ERL_NIF_TERM
ex_CDLSPINNINGTOP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSPINNINGTOP
}
static ERL_NIF_TERM
ex_CDLSTALLEDPATTERN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSTALLEDPATTERN
}
static ERL_NIF_TERM
ex_CDLSTICKSANDWICH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLSTICKSANDWICH
}
static ERL_NIF_TERM
ex_CDLTAKURI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLTAKURI
}
static ERL_NIF_TERM
ex_CDLTASUKIGAP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLTASUKIGAP
}
static ERL_NIF_TERM
ex_CDLTHRUSTING(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLTHRUSTING
}
static ERL_NIF_TERM
ex_CDLTRISTAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLTRISTAR
}
static ERL_NIF_TERM
ex_CDLUNIQUE3RIVER(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLUNIQUE3RIVER
}
static ERL_NIF_TERM
ex_CDLUPSIDEGAP2CROWS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLUPSIDEGAP2CROWS
}
static ERL_NIF_TERM
ex_CDLXSIDEGAP3METHODS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CDLXSIDEGAP3METHODS
}
static ERL_NIF_TERM
ex_CEIL(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CEIL
}
static ERL_NIF_TERM
ex_CMO(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CMO
}
static ERL_NIF_TERM
ex_CORREL(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_CORREL
}
static ERL_NIF_TERM
ex_COS(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_COS
}
static ERL_NIF_TERM
ex_COSH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_COSH
}
static ERL_NIF_TERM
ex_DEMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_DEMA
}
static ERL_NIF_TERM
ex_DIV(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_DIV
}
static ERL_NIF_TERM
ex_DX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_DX
}
static ERL_NIF_TERM
ex_EMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_EMA
}
static ERL_NIF_TERM
ex_EXP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_EXP
}
static ERL_NIF_TERM
ex_FLOOR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_FLOOR
}
static ERL_NIF_TERM
ex_HT_DCPERIOD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_DCPERIOD
}
static ERL_NIF_TERM
ex_HT_DCPHASE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_DCPHASE
}
static ERL_NIF_TERM
ex_HT_PHASOR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_PHASOR
}
static ERL_NIF_TERM
ex_HT_SINE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_SINE
}
static ERL_NIF_TERM
ex_HT_TRENDLINE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_TRENDLINE
}
static ERL_NIF_TERM
ex_HT_TRENDMODE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_HT_TRENDMODE
}
static ERL_NIF_TERM
ex_KAMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_KAMA
}
static ERL_NIF_TERM
ex_LINEARREG(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LINEARREG
}
static ERL_NIF_TERM
ex_LINEARREG_ANGLE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LINEARREG_ANGLE
}
static ERL_NIF_TERM
ex_LINEARREG_INTERCEPT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LINEARREG_INTERCEPT
}
static ERL_NIF_TERM
ex_LINEARREG_SLOPE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LINEARREG_SLOPE
}
static ERL_NIF_TERM
ex_LN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LN
}
static ERL_NIF_TERM
ex_LOG10(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_LOG10
}
static ERL_NIF_TERM
ex_MA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MA
}
static ERL_NIF_TERM
ex_MACD(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MACD
}
static ERL_NIF_TERM
ex_MACDEXT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MACDEXT
}
static ERL_NIF_TERM
ex_MACDFIX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MACDFIX
}
static ERL_NIF_TERM
ex_MAMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MAMA
}
static ERL_NIF_TERM
ex_MAVP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MAVP
}
static ERL_NIF_TERM
ex_MAX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MAX
}
static ERL_NIF_TERM
ex_MAXINDEX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MAXINDEX
}
static ERL_NIF_TERM
ex_MEDPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MEDPRICE
}
static ERL_NIF_TERM
ex_MFI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MFI
}
static ERL_NIF_TERM
ex_MIDPOINT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MIDPOINT
}
static ERL_NIF_TERM
ex_MIDPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MIDPRICE
}
static ERL_NIF_TERM
ex_MIN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MIN
}
static ERL_NIF_TERM
ex_MININDEX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MININDEX
}
static ERL_NIF_TERM
ex_MINMAX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MINMAX
}
static ERL_NIF_TERM
ex_MINMAXINDEX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MINMAXINDEX
}
static ERL_NIF_TERM
ex_MINUS_DI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MINUS_DI
}
static ERL_NIF_TERM
ex_MINUS_DM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MINUS_DM
}
static ERL_NIF_TERM
ex_MOM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MOM
}
static ERL_NIF_TERM
ex_MULT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_MULT
}
static ERL_NIF_TERM
ex_NATR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_NATR
}
static ERL_NIF_TERM
ex_OBV(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_OBV
}
static ERL_NIF_TERM
ex_PLUS_DI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_PLUS_DI
}
static ERL_NIF_TERM
ex_PLUS_DM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_PLUS_DM
}
static ERL_NIF_TERM
ex_PPO(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_PPO
}
static ERL_NIF_TERM
ex_ROC(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ROC
}
static ERL_NIF_TERM
ex_ROCP(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ROCP
}
static ERL_NIF_TERM
ex_ROCR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ROCR
}
static ERL_NIF_TERM
ex_ROCR100(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_ROCR100
}
static ERL_NIF_TERM
ex_RSI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_RSI
}
static ERL_NIF_TERM
ex_SAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_SAR
}
static ERL_NIF_TERM
ex_SAREXT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_SAREXT
}
static ERL_NIF_TERM
ex_SIN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_SIN
}
static ERL_NIF_TERM
ex_SINH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
     TA_SINH
}
*/
static ERL_NIF_TERM
ex_SMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    return call_function_with_one_in_array_and_one_argument(env, argc, argv, "window", &TA_SMA);
}
static ERL_NIF_TERM
ex_SQRT(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    return call_function_with_one_in_array(env, argc, argv, &TA_SQRT);
}
/*
 static ERL_NIF_TERM
 ex_STDDEV(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_STDDEV
 }
 static ERL_NIF_TERM
 ex_STOCH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_STOCH
 }
 static ERL_NIF_TERM
 ex_STOCHF(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_STOCHF
 }
 static ERL_NIF_TERM
 ex_STOCHRSI(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_STOCHRSI
 }
 static ERL_NIF_TERM
 ex_SUB(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_SUB
 }
 static ERL_NIF_TERM
 ex_SUM(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_SUM
 }
 static ERL_NIF_TERM
 ex_T3(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_T3
 }
 static ERL_NIF_TERM
 ex_TAN(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TAN
 }
 static ERL_NIF_TERM
 ex_TANH(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TANH
 }
 static ERL_NIF_TERM
 ex_TEMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TEMA
 }
 static ERL_NIF_TERM
 ex_TRANGE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TRANGE
 }
 static ERL_NIF_TERM
 ex_TRIMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TRIMA
 }
 static ERL_NIF_TERM
 ex_TRIX(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TRIX
 }
 static ERL_NIF_TERM
 ex_TSF(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TSF
 }
 static ERL_NIF_TERM
 ex_TYPPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_TYPPRICE
 }
 static ERL_NIF_TERM
 ex_ULTOSC(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_ULTOSC
 }
 static ERL_NIF_TERM
 ex_VAR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_VAR
 }
 static ERL_NIF_TERM
 ex_WCLPRICE(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_WCLPRICE
 }
 static ERL_NIF_TERM
 ex_WILLR(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_WILLR
 }
 static ERL_NIF_TERM
 ex_WMA(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
 {
      TA_WMA
}
*/
static ErlNifFunc funcs[] = {
    {"nif_acos", 2, ex_ACOS, 0},
    {"nif_ad", 2, ex_AD, 0},
    {"nif_add", 2, ex_ADD, 0},
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