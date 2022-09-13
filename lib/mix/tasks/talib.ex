defmodule Mix.Tasks.Talib do
  @moduledoc "Generate c code fo ta-lib nif"
  @shortdoc "Generate c code fo ta-lib nif"

  use Mix.Task
  @dir Path.join([__DIR__, "..", "..", "..", "c_src"]) |> Path.expand()
  @mapping [
    # %{
    #   name: "acos",
    #   target: "TA_ACOS",
    #   inputs: [%{type: :double_array}],
    #   outputs: [%{type: :double_array}]
    # }
    %{
      name: "add",
      target: "TA_ADD",
      inputs: [%{type: :double_array}, %{type: :double_array}],
      outputs: [%{type: :double_array}]
    }
  ]
  @impl Mix.Task
  def run(_args) do
    @mapping
    |> Enum.map(&build_function/1)
    |> Enum.join(",\n")
    |> IO.puts()
  end

  defp build_function(%{name: name, target: target, inputs: inputs, outputs: outputs}) do
    vars = declare_inputs(inputs)
    outputs = declare_outputs(outputs)
    inputs_length = length(inputs)
    outputs_length = length(outputs)

    content = """
    #include "erl_nif.h"
    #include "util.h"
    #include "talib_ex_util.h"
    #include "talib_ex_functions.h"
    #include "ta_libc.h"
    #include <stdbool.h>

    ERL_NIF_TERM
    ex_#{name}(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
    {
      talib_st *atoms =  enif_priv_data(env);
      if(argc != #{inputs_length}){
        return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "should be called with #{inputs_length}", ERL_NIF_LATIN1));
      }
      int startIdx = 0;
      int endIdx = 0;
      unsigned inLen = 0;
      unsigned tmpLen = 0;
      int optInTimePeriod;
      int outBegIdx;
      int outNBElement;

      #{Enum.map_join(vars, "\n", & &1.declare)}
      #{Enum.map_join(outputs, "\n", & &1.declare)}

      /* call TA-Lib function */
      TA_RetCode retCode = #{target}(
          startIdx,
          endIdx,
          #{Enum.map_join(vars, ",\n      ", & &1.name)},
          &outBegIdx,
          &outNBElement,
          #{Enum.map_join(outputs, ",\n      ", &"&#{&1.binding}")});

      /* generate results */
      ERL_NIF_TERM results;
      if (retCode != TA_SUCCESS)
      {
          /* generate error message */
          TA_RetCodeInfo info;
          TA_SetRetCodeInfo(retCode, &info);
          results = enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, info.infoStr, ERL_NIF_LATIN1));
      } else {
        ERL_NIF_TERM values[#{outputs_length}];
        #{Enum.map_join(outputs, "\n        ", & &1.load)}
        results = enif_make_tuple2(env, atoms->atom_ok, enif_make_list_from_array(env, values, 1));
      }
      /* clean up */
      #{destroy_inputs(vars)}
      #{Enum.map_join(outputs, "\n  ", & &1.destroy)}

      /* return the results; */
      return results;
    }
    """

    binding = ~s[{"nif_#{name}", #{inputs_length}, ex_#{name}, 0}]

    @dir
    |> Path.join("func_#{name}.c")
    |> IO.inspect()
    |> File.write!(content)

    binding
  end

  defp destroy_inputs(vars), do: Enum.map_join(vars, "\n  ", & &1.destroy)
  defp declare_inputs(inputs, vars \\ [], pos \\ 0)
  defp declare_inputs([], vars, _), do: Enum.reverse(vars)

  defp declare_inputs([input | inputs], vars, pos),
    do: declare_inputs(inputs, [declare_input(input, pos, vars) | vars], pos + 1)

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
      declare: """
      if(!enif_is_list(env, argv[#{pos}])){
        #{destroy_inputs(prev_vars)}
        return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "element at #{pos} should be a list", ERL_NIF_LATIN1));
      }
      double *#{name} = construct_array_from_list(env, argv[#{pos}], &tmpLen);

      if(tmpLen == 0) {
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
      declare: """
      double *#{name} = (double *)enif_alloc((inLen) * sizeof(double));

      """,
      load: """
      values[#{pos}] = populate_output_double(env, atoms, outBegIdx, inLen, 0, #{name});
      """,
      name: name,
      binding: "#{name}[0]",
      destroy: """
      if(#{name} != NULL)
      {
        enif_free(#{name});
        #{name} = NULL;
      }
      """
    }
  end
end
