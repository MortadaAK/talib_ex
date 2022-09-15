/* GENERATED FILE */
#include "erl_nif.h"
#include "util.h"
#include "ta_libc.h"
#include "funcs.h"
#include <stdbool.h>

ERL_NIF_TERM
ex_macdext(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
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
  int input1;
  TA_MAType input2;
  int input3;
  TA_MAType input4;
  int input5;
  TA_MAType input6;
  double *out0;
  double *out1;
  double *out2;

  /* inform erlang scheduler that we just started */
  enif_consume_timeslice(env, 0);

  if (argc != 7)
  {
    return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "should be called with 7", ERL_NIF_LATIN1));
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


  if (!enif_is_number(env, argv[1]))
  {
      if (input0 != NULL)
  {
    enif_free(input0);
    input0 = NULL;
  }

    return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "fast_period should be an integer", ERL_NIF_LATIN1));
  }
  enif_get_int(env, argv[1], &input1);

  load_moving_average_type(argv[2], atoms, &input2);

  if (!enif_is_number(env, argv[3]))
  {
    

  if (input0 != NULL)
  {
    enif_free(input0);
    input0 = NULL;
  }

    return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "slow_period should be an integer", ERL_NIF_LATIN1));
  }
  enif_get_int(env, argv[3], &input3);

  load_moving_average_type(argv[4], atoms, &input4);

  if (!enif_is_number(env, argv[5]))
  {
    



  if (input0 != NULL)
  {
    enif_free(input0);
    input0 = NULL;
  }

    return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "signal_period should be an integer", ERL_NIF_LATIN1));
  }
  enif_get_int(env, argv[5], &input5);

  load_moving_average_type(argv[6], atoms, &input6);

out0 = (double *)enif_alloc((inLen) * sizeof(double));


out1 = (double *)enif_alloc((inLen) * sizeof(double));


out2 = (double *)enif_alloc((inLen) * sizeof(double));



  /* inform erlang scheduler that we finished preparing the array */
  enif_consume_timeslice(env, 10);

  /* call TA-Lib function */
  retCode = TA_MACDEXT(
      startIdx,
      endIdx,
      input0,
      input1,
      input2,
      input3,
      input4,
      input5,
      input6,
      &outBegIdx,
      &outNBElement,
      &out0[0],
      &out1[0],
      &out2[0]);

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
    results = enif_make_tuple4(
      env,
      atoms->atom_ok,
      populate_output_double(env, atoms, outBegIdx, inLen, out0),
      populate_output_double(env, atoms, outBegIdx, inLen, out1),
      populate_output_double(env, atoms, outBegIdx, inLen, out2)
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

  if (out1 != NULL)
  {
    enif_free(out1);
    out1 = NULL;
  }

  if (out2 != NULL)
  {
    enif_free(out2);
    out2 = NULL;
  }

  enif_consume_timeslice(env, 100);

  /* return the results; */
  return results;
}
