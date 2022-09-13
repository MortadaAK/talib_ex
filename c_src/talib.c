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
  {"nif_acos", 1, ex_acos, 0}, 
{"nif_ad", 4, ex_ad, 0}, 
{"nif_add", 2, ex_add, 0}, 
{"nif_adosc", 6, ex_adosc, 0}, 
{"nif_adx", 4, ex_adx, 0}, 
{"nif_adxr", 4, ex_adxr, 0}, 
{"nif_apo", 4, ex_apo, 0}, 
{"nif_aroon", 3, ex_aroon, 0}, 
{"nif_sma", 2, ex_sma, 0}, 
{"nif_sqrt", 1, ex_sqrt, 0}
};


ERL_NIF_INIT(Elixir.TalibEx.Nif, funcs, &load, &reload, &upgrade, &unload)
