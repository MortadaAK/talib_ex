/* GENERATED FILE */
#include "erl_nif.h"
#include "util.h"
#include "ta_libc.h"
#include "funcs.h"
#include <stdbool.h>

ERL_NIF_TERM
ex_tan(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  talib_st *atoms =  enif_priv_data(env);
  int startIdx = 0;
  int endIdx = 0;
  unsigned inLen = 0;
  unsigned tmpLen = 0;
  int outBegIdx;
  int outNBElement;
  TA_RetCode retCode;
  TA_RetCodeInfo info;
  ERL_NIF_TERM results;
  double *input0;
  double *out0;

  /* inform erlang scheduler that we just started */
  enif_consume_timeslice(env, 0);

  if (argc != 1)
  {
    return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "should be called with 1", ERL_NIF_LATIN1));
  }
  if (!enif_is_list(env, argv[0]))
  {
  
    return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "values should be a list", ERL_NIF_LATIN1));
  }

  input0 = construct_array_from_list(env, argv[0], &tmpLen);
  if (tmpLen == 0)
  {
    
    return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "values is an empty list", ERL_NIF_LATIN1));
  }

  inLen = tmpLen;
  endIdx = tmpLen - 1;


out0 = (double *)enif_alloc((inLen) * sizeof(double));



  /* inform erlang scheduler that we finished preparing the array */
  enif_consume_timeslice(env, 10);

  /* call TA-Lib function */
  retCode = TA_TAN(
      startIdx,
      endIdx,
      input0,
      &outBegIdx,
      &outNBElement,
      &out0[0]);

  /* inform erlang scheduler that we finished calculating */
  enif_consume_timeslice(env, 90);

  /* generate results */
  if (retCode != TA_SUCCESS)
  {
      /* generate error message */
      TA_SetRetCodeInfo(retCode, &info);
      results = enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, info.infoStr, ERL_NIF_LATIN1));
  }
  else
  {
    results = enif_make_tuple2(
      env,
      atoms->atom_ok,
      populate_output_double(env, atoms, outBegIdx, inLen, out0)
    );
  }
  /* clean up */
  if (input0 != NULL)
  {
    enif_free(input0);
    input0 = NULL;
  }

  if (out0 != NULL)
  {
    enif_free(out0);
    out0 = NULL;
  }

  enif_consume_timeslice(env, 100);

  /* return the results; */
  return results;
}
