defmodule Mix.Tasks.Talib do
  @moduledoc "Generate c code fo ta-lib nif"
  @shortdoc "Generate c code fo ta-lib nif"

  use Mix.Task
  @c_dir Path.join([__DIR__, "..", "..", "..", "c_src"]) |> Path.expand()
  @module_dir Path.join([__DIR__, "..", ".."]) |> Path.expand()
  @mapping [
    %{
      name: "acos",
      target: "TA_ACOS",
      inputs: [%{type: :double_array}],
      outputs: [%{type: :double_array}]
    },
    %{
      name: "ad",
      target: "TA_AD",
      inputs: [
        %{type: :double_array},
        %{type: :double_array},
        %{type: :double_array},
        %{type: :double_array}
      ],
      outputs: [%{type: :double_array}]
    },
    %{
      name: "add",
      target: "TA_ADD",
      inputs: [%{type: :double_array}, %{type: :double_array}],
      outputs: [%{type: :double_array}]
    },
    %{
      name: "adosc",
      target: "TA_ADOSC",
      inputs: [
        %{type: :double_array},
        %{type: :double_array},
        %{type: :double_array},
        %{type: :double_array},
        %{type: :integer},
        %{type: :integer}
      ],
      outputs: [%{type: :double_array}]
    },
    %{
      name: "adx",
      target: "TA_ADX",
      inputs: [
        %{type: :double_array},
        %{type: :double_array},
        %{type: :double_array},
        %{type: :integer}
      ],
      outputs: [%{type: :double_array}]
    },
    %{
      name: "adxr",
      target: "TA_ADXR",
      inputs: [
        %{type: :double_array},
        %{type: :double_array},
        %{type: :double_array},
        %{type: :integer}
      ],
      outputs: [%{type: :double_array}]
    },
    %{
      name: "apo",
      target: "TA_APO",
      inputs: [
        %{type: :double_array},
        %{type: :integer},
        %{type: :integer},
        %{type: :ma_type}
      ],
      outputs: [%{type: :double_array}]
    },
    %{
      name: "aroon",
      target: "TA_AROON",
      inputs: [
        %{type: :double_array},
        %{type: :double_array},
        %{type: :integer}
      ],
      outputs: [
        %{type: :double_array},
        %{type: :double_array}
      ]
    },
    %{
      name: "aroonosc",
      target: "TA_AROONOSC",
      inputs: [
        %{type: :double_array},
        %{type: :double_array},
        %{type: :integer}
      ],
      outputs: [
        %{type: :double_array}
      ]
    },
    %{
      name: "asin",
      target: "TA_ASIN",
      inputs: [
        %{type: :double_array}
      ],
      outputs: [
        %{type: :double_array}
      ]
    },
    %{
      name: "sma",
      target: "TA_SMA",
      inputs: [
        %{type: :double_array},
        %{type: :integer}
      ],
      outputs: [%{type: :double_array}]
    },
    %{
      name: "sqrt",
      target: "TA_SQRT",
      inputs: [
        %{type: :double_array}
      ],
      outputs: [%{type: :double_array}]
    }
  ]
  @impl Mix.Task
  def run(_args) do
    {bindings, headers, nif_functions} =
      Enum.reduce(@mapping, {[], [], []}, fn func, {bindings, headers, nif_functions} ->
        %{
          name: name,
          binding: binding,
          content: content,
          header: header,
          nif_function: nif_function
        } = build_function(func)

        @c_dir
        |> Path.join("func_#{name}.c")
        |> File.write!(content)

        {[binding | bindings], [header | headers], [nif_function | nif_functions]}
      end)

    bindings |> Enum.reverse() |> generate_bindings()
    headers |> Enum.reverse() |> generate_headers()
    nif_functions |> Enum.reverse() |> generate_nif_module()
  end

  defp generate_headers(headers) do
    content = """
    #ifndef TALIBEX_FUNCTIONS_H
    #define TALIBEX_FUNCTIONS_H

    #include "erl_nif.h"

    #{Enum.join(headers, "\n")}

    #endif
    """

    @c_dir
    |> Path.join("funcs.h")
    |> File.write!(content)
  end

  defp build_function(%{name: name, target: target, inputs: inputs, outputs: outputs}) do
    vars = declare_inputs(inputs)
    outputs = declare_outputs(outputs)
    inputs_length = length(inputs)
    outputs_length = length(outputs)

    content = """
    #include "erl_nif.h"
    #include "util.h"
    #include "ta_libc.h"
    #include "funcs.h"
    #include <stdbool.h>

    ERL_NIF_TERM
    ex_#{name}(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
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
    #{Enum.map_join(vars, "\n", & &1.type)}
    #{Enum.map_join(outputs, "\n", & &1.type)}
      if (argc != #{inputs_length})
      {
        return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "should be called with #{inputs_length}", ERL_NIF_LATIN1));
      }
    #{Enum.map_join(vars, "\n", & &1.declare)}
    #{Enum.map_join(outputs, "\n", & &1.declare)}

      /* call TA-Lib function */
      retCode = #{target}(
          startIdx,
          endIdx,
          #{Enum.map_join(vars, ",\n      ", & &1.name)},
          &outBegIdx,
          &outNBElement,
          #{Enum.map_join(outputs, ",\n      ", &"&#{&1.binding}")});

      /* generate results */
      if (retCode != TA_SUCCESS)
      {
          /* generate error message */
          TA_SetRetCodeInfo(retCode, &info);
          results = enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, info.infoStr, ERL_NIF_LATIN1));
      } else {
        ERL_NIF_TERM values[#{outputs_length}];
        #{Enum.map_join(outputs, "\n        ", & &1.load)}
        results = enif_make_tuple2(env, atoms->atom_ok, enif_make_list_from_array(env, values, #{outputs_length}));
      }
      /* clean up */
    #{destroy_inputs(vars)}
    #{Enum.map_join(outputs, "\n", & &1.destroy)}

      /* return the results; */
      return results;
    }
    """

    binding = ~s[{"nif_#{name}", #{inputs_length}, ex_#{name}, 0}]

    header = """
    ERL_NIF_TERM
    ex_#{name}(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[]);
    """

    args = Stream.repeatedly(fn -> "_" end) |> Enum.take(inputs_length) |> Enum.join(", ")

    nif_function = ~s{
  def nif_#{name}(#{args}) do
    raise "nif_#{name}/#{inputs_length} not implemented end"
  end}

    %{binding: binding, content: content, header: header, name: name, nif_function: nif_function}
  end

  defp destroy_inputs(vars), do: Enum.map_join(vars, "\n", & &1.destroy)
  defp declare_inputs(inputs, vars \\ [], pos \\ 0)
  defp declare_inputs([], vars, _), do: Enum.reverse(vars)

  defp declare_inputs([input | inputs], vars, pos),
    do: declare_inputs(inputs, [declare_input(input, pos, vars) | vars], pos + 1)

  defp declare_input(%{type: :integer}, pos, prev_vars) do
    name = "input#{pos}"

    destroy = ""

    %{
      type: "  int #{name};",
      declare: """
        if (!enif_is_number(env, argv[#{pos}]))
        {
          #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at #{pos} should be an integer", ERL_NIF_LATIN1));
        }
        #{name} = argv[#{pos}];
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_input(%{type: :ma_type}, pos, prev_vars) do
    name = "input#{pos}"

    destroy = ""

    %{
      type: "  TA_MAType #{name};",
      declare: """
        if (!enif_is_number(env, argv[#{pos}])){
          #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at #{pos} should be an integer from 0 - 8", ERL_NIF_LATIN1));
        }
        switch(argv[#{pos}])
        {
          case 0:
          #{name}= TA_MAType_SMA;
          break;
          case 1:
          #{name}= TA_MAType_EMA;
          break;
          case 2:
          #{name}= TA_MAType_WMA;
          break;
          case 3:
          #{name}= TA_MAType_DEMA;
          break;
          case 4:
          #{name}= TA_MAType_TEMA;
          break;
          case 5:
          #{name}= TA_MAType_TRIMA;
          break;
          case 6:
          #{name}= TA_MAType_KAMA;
          break;
          case 7:
          #{name}= TA_MAType_MAMA;
          break;
          case 8:
          #{name}= TA_MAType_T3;
          break;
          default:
          #{name}= TA_MAType_SMA;
        }
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_input(%{type: :double_array}, pos, prev_vars) do
    name = "input#{pos}"

    destroy = """
      if (#{name} != NULL)
        {
          enif_free(#{name});
          #{name} = NULL;
        }
    """

    %{
      type: "  double *#{name};",
      declare: """
        if (!enif_is_list(env, argv[#{pos}]))
        {
        #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at #{pos} should be a list", ERL_NIF_LATIN1));
        }

        #{name} = construct_array_from_list(env, argv[#{pos}], &tmpLen);

        if (tmpLen == 0)
        {
          #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at #{pos} is an empty list", ERL_NIF_LATIN1));
        }

        if (inLen != 0 && tmpLen != inLen)
        {
          #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at #{pos} is a list with different length", ERL_NIF_LATIN1));
        }

        inLen = tmpLen;
        endIdx = tmpLen - 1;
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_outputs(inputs, vars \\ [], pos \\ 0)
  defp declare_outputs([], vars, _), do: Enum.reverse(vars)

  defp declare_outputs([input | inputs], vars, pos),
    do: declare_outputs(inputs, [declare_output(input, pos, vars) | vars], pos + 1)

  defp declare_output(%{type: :double_array}, pos, _prev_vars) do
    name = "out#{pos}"

    %{
      type: "  double *#{name};",
      declare: """
      #{name} = (double *)enif_alloc((inLen) * sizeof(double));

      """,
      load: """
      values[#{pos}] = populate_output_double(env, atoms, outBegIdx, inLen, 0, #{name});
      """,
      name: name,
      binding: "#{name}[0]",
      destroy: """
        if (#{name} != NULL)
        {
          enif_free(#{name});
          #{name} = NULL;
        }
      """
    }
  end

  defp generate_bindings(bindings) do
    content = """
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
      #{Enum.join(bindings, ", \n")}
    };


    ERL_NIF_INIT(Elixir.TalibEx.Nif, funcs, &load, &reload, &upgrade, &unload)
    """

    @c_dir
    |> Path.join("talib.c")
    |> File.write!(content)
  end

  def generate_nif_module(nif_functions) do
    content = ~s{defmodule TalibEx.Nif do
  @moduledoc """
  Documentation for `TalibEx`.
  """
  @on_load :load_nifs

  def load_nifs do
    :talib_ex
    |> :code.priv_dir()
    |> Path.join("talib")
    |> :erlang.load_nif (0)
  end
#{Enum.join(nif_functions, "\n")}
end
  }

    @module_dir
    |> Path.join("nif.ex")
    |> File.write!(content)
  end
end
