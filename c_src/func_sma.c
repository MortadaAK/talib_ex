#include "erl_nif.h"
#include "util.h"
#include "ta_libc.h"
#include "funcs.h"
#include <stdbool.h>

ERL_NIF_TERM
ex_sma(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  talib_st *atoms =  enif_priv_data(env);
  if(argc != 2){
    return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "should be called with 2", ERL_NIF_LATIN1));
  }
  int startIdx = 0;
  int endIdx = 0;
  unsigned inLen = 0;
  unsigned tmpLen = 0;
  int optInTimePeriod;
  int outBegIdx;
  int outNBElement;

  if(!enif_is_list(env, argv[0])){
  
  return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at 0 should be a list", ERL_NIF_LATIN1));
}
double *input0 = construct_array_from_list(env, argv[0], &tmpLen);

if(tmpLen == 0) {
  
  return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at 0 is an empty list", ERL_NIF_LATIN1));
}

if (inLen != 0 && tmpLen != inLen)
{
  
  return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at 0 is a list with different length", ERL_NIF_LATIN1));
}
inLen = tmpLen;
endIdx = tmpLen - 1;

if(!enif_is_number(env, argv[1])){
  if (input0 != NULL)
{
    enif_free(input0);
    input0 = NULL;
}

  return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at 1 should be an integer", ERL_NIF_LATIN1));
}
int input1 = argv[1];

  double *out0 = (double *)enif_alloc((inLen) * sizeof(double));



  /* call TA-Lib function */
  TA_RetCode retCode = TA_SMA(
      startIdx,
      endIdx,
      input0,
      input1,
      &outBegIdx,
      &outNBElement,
      &out0[0]);

  /* generate results */
  ERL_NIF_TERM results;
  if (retCode != TA_SUCCESS)
  {
      /* generate error message */
      TA_RetCodeInfo info;
      TA_SetRetCodeInfo(retCode, &info);
      results = enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, info.infoStr, ERL_NIF_LATIN1));
  } else {
    ERL_NIF_TERM values[1];
    values[0] = populate_output_double(env, atoms, outBegIdx, inLen, 0, out0);

    results = enif_make_tuple2(env, atoms->atom_ok, enif_make_list_from_array(env, values, 1));
  }
  /* clean up */
  if (input0 != NULL)
{
    enif_free(input0);
    input0 = NULL;
}

  if (input1 != NULL)
{
    input1 = NULL;
}

  if(out0 != NULL)
{
  enif_free(out0);
  out0 = NULL;
}


  /* return the results; */
  return results;
}
