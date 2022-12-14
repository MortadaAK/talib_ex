defmodule Mix.Tasks.Talib do
  @moduledoc "Generate c code fo ta-lib nif"
  @shortdoc "Generate c code fo ta-lib nif"

  use Mix.Task
  @c_dir Path.join([__DIR__, "..", "..", "..", "c_src"]) |> Path.expand()
  @module_dir Path.join([__DIR__, "..", ".."]) |> Path.expand()

  @impl Mix.Task
  def run(_args \\ []) do
    {bindings, headers, nif_functions, elixir_functions} =
      Enum.reduce(
        TalibEx.FunctionDef.mapping(),
        {[], [], [], []},
        fn func, {bindings, headers, nif_functions, elixir_functions} ->
          %{
            name: name,
            binding: binding,
            content: content,
            header: header,
            nif_function: nif_function,
            elixir_function: elixir_function
          } = build_function(func)

          @c_dir
          |> Path.join("func_#{name}.c")
          |> write_file(content)

          {[binding | bindings], [header | headers], [nif_function | nif_functions],
           [elixir_function | elixir_functions]}
        end
      )

    bindings |> Enum.reverse() |> generate_bindings()
    headers |> Enum.reverse() |> generate_headers()
    nif_functions |> Enum.reverse() |> generate_nif_module()
    elixir_functions |> Enum.reverse() |> generate_elixir_module()
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
    |> write_file(content)
  end

  defp build_function(%{name: name, doc: doc, target: target, inputs: inputs, outputs: outputs}) do
    vars = declare_inputs(inputs)
    inputs_length = length(inputs)
    outputs_length = length(outputs)

    elixir_function =
      build_elixir_function(%{
        name: name,
        doc: doc,
        outputs: outputs,
        inputs: inputs,
        inputs_length: inputs_length,
        outputs_length: outputs_length,
        target: target
      })

    outputs = declare_outputs(outputs)

    content =
      build_c_function(%{
        name: name,
        vars: vars,
        outputs: outputs,
        inputs_length: inputs_length,
        outputs_length: outputs_length,
        target: target
      })

    # ERL_NIF_DIRTY_JOB_CPU_BOUND is used to schedule the nif in the dirty CPU
    binding = ~s[{"nif_#{name}", #{inputs_length}, ex_#{name}, ERL_NIF_DIRTY_JOB_CPU_BOUND}]

    header = """
    ERL_NIF_TERM
    ex_#{name}(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[]);
    """

    args = Stream.repeatedly(fn -> "_" end) |> Enum.take(inputs_length) |> Enum.join(", ")

    nif_function = """
    def nif_#{name}(#{args}) do
      raise "nif_#{name}/#{inputs_length} not implemented end"
    end
    """

    %{
      binding: binding,
      content: content,
      header: header,
      name: name,
      elixir_function: elixir_function,
      nif_function: nif_function
    }
  end

  def build_elixir_function(%{
        name: name,
        doc: doc,
        outputs: outputs,
        inputs: inputs,
        inputs_length: inputs_length,
        target: target
      }) do
    name = String.trim(name)

    inputs_spec =
      Enum.map(inputs, fn
        %{name: name, type: :double_array} ->
          "{:#{name}, [number()]}"

        %{name: name, type: :integer} ->
          "{:#{name}, pos_integer()}"

        %{name: name, type: :ma_type} ->
          "{:#{name}, :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}"

        %{name: name, type: :double} ->
          "{:#{name}, number()}"
      end)

    loaded_inputs =
      Enum.map(inputs, &"|> Executer.load(:#{&1.name},:#{&1.type} #{executer_params(&1)})\n")

    outputs_spec =
      Enum.map(outputs, fn
        %{name: name, type: :double_array} ->
          "#{name} :: [number()|:nan]"

        %{name: name, type: :integer_array} ->
          "#{name} :: [integer()|:nan]"
      end)

    input_docs = Enum.map_join(inputs, "\n", &describe_input/1)
    output_docs = Enum.map_join(outputs, "\n", &describe_output/1)

    """
    @dialyzer {:nowarn_function, #{name}: 1}
    @spec #{name}([#{Enum.join(inputs_spec, "| ")}]) :: {:ok, #{Enum.join(outputs_spec, ", ")}} | {:error,term()}
    @doc \"\"\"
    #{doc}

    ---
    Inputs
    #{input_docs}

    ---
    Outputs
    #{output_docs}

    ---
    TA-LIB src `#{target}`
    \"\"\"
    def #{name}(params) do
      params
      |> Executer.new()
      #{loaded_inputs}
      |> Executer.call(&Nif.nif_#{name}/#{inputs_length})
    end
    """
  end

  defp executer_params(%{min: min, max: max, default: default}),
    do: ", %{default: #{inspect(default)}, min: #{min}, max: #{max}}"

  defp executer_params(%{min: min, max: max}), do: ", %{min: #{min}, max: #{max}}"

  defp executer_params(%{min: min, default: default}),
    do: ", %{default: #{inspect(default)}, min: #{min}}"

  defp executer_params(%{min: min}), do: ", %{min: #{min}}"

  defp executer_params(%{default: default}),
    do: ", %{default: #{inspect(default)}}"

  defp executer_params(_), do: ""

  defp describe_input(%{name: name} = input) do
    min = Map.get(input, :min)
    max = Map.get(input, :max)
    default = Map.get(input, :default)
    doc = Map.get(input, :doc)

    "- `#{name}`"
    |> then(fn
      value when not is_nil(default) -> "#{value} (default `#{inspect(default)}`)"
      value -> value
    end)
    |> then(fn
      value when not is_nil(doc) -> "#{value}: #{doc}"
      value -> value
    end)
    |> then(fn
      value when not is_nil(min) and not is_nil(max) -> "#{value} (between `#{min}` and `#{max}`)"
      value when not is_nil(min) -> "#{value} (minuimum `#{min}`)"
      value when not is_nil(max) -> "#{value} (maximum `#{max}`)"
      value -> value
    end)
  end

  defp describe_output(%{name: name, doc: doc}), do: "- `#{name}`: #{doc}"
  defp describe_output(%{name: name}), do: "- `#{name}`"

  def build_c_function(%{
        name: name,
        vars: vars,
        outputs: outputs,
        inputs_length: inputs_length,
        outputs_length: outputs_length,
        target: target
      }) do
    """
    /* GENERATED FILE */
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
    #{Enum.map_join(vars, "\n", & &1.typec)}
    #{Enum.map_join(outputs, "\n", & &1.typec)}

      /* inform erlang scheduler that we just started */
      enif_consume_timeslice(env, 0);

      if (argc != #{inputs_length})
      {
        return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "should be called with #{inputs_length}", ERL_NIF_LATIN1));
      }
    #{Enum.map_join(vars, "\n", & &1.declare)}
    #{Enum.map_join(outputs, "\n", & &1.declare)}

      /* inform erlang scheduler that we finished preparing the array */
      enif_consume_timeslice(env, 10);

      /* call TA-Lib function */
      retCode = #{target}(
          startIdx,
          endIdx,
          #{Enum.map_join(vars, ",\n      ", & &1.name)},
          &outBegIdx,
          &outNBElement,
          #{Enum.map_join(outputs, ",\n      ", &"&#{&1.binding}")});

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
        results = enif_make_tuple#{outputs_length + 1}(
          env,
          atoms->atom_ok,
    #{Enum.map_join(outputs, ",\n", & &1.load)}
        );
      }
      /* clean up */
    #{destroy_inputs(vars)}
    #{Enum.map_join(outputs, "\n", & &1.destroy)}
      enif_consume_timeslice(env, 100);

      /* return the results; */
      return results;
    }
    """
  end

  defp destroy_inputs(vars), do: Enum.map_join(vars, "\n", & &1.destroy)
  defp declare_inputs(inputs, vars \\ [], pos \\ 0)
  defp declare_inputs([], vars, _), do: Enum.reverse(vars)

  defp declare_inputs([input | inputs], vars, pos),
    do: declare_inputs(inputs, [declare_input(input, pos, vars) | vars], pos + 1)

  defp declare_input(%{type: :integer, name: input_name}, pos, prev_vars) do
    name = "input#{pos}"

    destroy = ""

    %{
      typec: "  int #{name};",
      declare: """
        if (!enif_is_number(env, argv[#{pos}]))
        {
          #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} should be an integer", ERL_NIF_LATIN1));
        }
        enif_get_int(env, argv[#{pos}], &#{name});
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_input(%{type: :double, name: input_name}, pos, prev_vars) do
    name = "input#{pos}"

    destroy = ""

    %{
      typec: "  double #{name};",
      declare: """
        if (!enif_is_number(env, argv[#{pos}]))
        {
          #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} should be an double", ERL_NIF_LATIN1));
        }
        enif_get_double(env, argv[#{pos}], &#{name});
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_input(%{type: :ma_type}, pos, _prev_vars) do
    name = "input#{pos}"

    destroy = ""

    %{
      type: :ma_type,
      typec: "  TA_MAType #{name};",
      declare: """
        load_moving_average_type(argv[#{pos}], atoms, &#{name});
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_input(%{type: :double_array, name: input_name}, pos, prev_vars) do
    name = "input#{pos}"

    destroy = """
      if (#{name} != NULL)
      {
        enif_free(#{name});
        #{name} = NULL;
      }
    """

    check =
      if Enum.any?(prev_vars, &(&1.type == :double_array)) do
        """
          if (inLen != 0 && tmpLen != inLen)
          {
            #{destroy_inputs(prev_vars)}
            return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} is a list with different length", ERL_NIF_LATIN1));
          }
        """
      else
        """
          if (tmpLen == 0)
          {
            #{destroy_inputs(prev_vars)}
            return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} is an empty list", ERL_NIF_LATIN1));
          }

          inLen = tmpLen;
          endIdx = tmpLen - 1;
        """
      end

    %{
      type: :double_array,
      typec: "  double *#{name};",
      declare: """
        if (!enif_is_list(env, argv[#{pos}]))
        {
        #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} should be a list", ERL_NIF_LATIN1));
        }

        #{name} = construct_array_from_list(env, argv[#{pos}], &tmpLen);
      #{check}
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
      type: :double_array,
      typec: "  double *#{name};",
      declare: """
      #{name} = (double *)enif_alloc((inLen) * sizeof(double));

      """,
      load: "      populate_output_double(env, atoms, outBegIdx, inLen, #{name})",
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

  defp declare_output(%{type: :integer_array}, pos, _prev_vars) do
    name = "out#{pos}"

    %{
      type: :double_array,
      typec: "  int *#{name};",
      declare: """
      #{name} = (int *)enif_alloc((inLen) * sizeof(int));

      """,
      load: "      populate_output_int(env, atoms, outBegIdx, inLen, #{name})",
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
    /* GENERATED FILE */
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

    static ErlNifFunc funcs[] = {
      #{Enum.join(bindings, ", \n")}
    };


    ERL_NIF_INIT(Elixir.TalibEx.Nif, funcs, &load, &reload, &upgrade, &unload)
    """

    @c_dir
    |> Path.join("talib.c")
    |> write_file(content)
  end

  def generate_nif_module(nif_functions) do
    content =
      """
          defmodule TalibEx.Nif do
            @moduledoc false
            # Generated File

            @on_load :load_nifs

            def load_nifs do
              :talib_ex
              |> :code.priv_dir()
              |> Path.join("talib")
              |> :erlang.load_nif(0)
            end

            #{Enum.join(nif_functions, "\n")}
          end
      """
      |> Code.format_string!()
      |> to_string()

    @module_dir
    |> Path.join("nif.ex")
    |> write_file(content)
  end

  def generate_elixir_module(functions) do
    content =
      ~s[
        defmodule TalibEx do
          @moduledoc """
          Interface for talib
          """
          # Generated File
          alias TalibEx.{Nif, Executer}

          #{Enum.join(functions, "\n")}
        end
      ]
      |> Code.format_string!()
      |> to_string()

    @module_dir
    |> Path.join("talib_ex.ex")
    |> write_file(content)
  end

  defp write_file(path, content) do
    if !File.exists?(path) do
      File.write!(path, content)
    else
      prev = File.read!(path)

      unless String.equivalent?(prev, content) do
        File.write!(path, content)
      end
    end
  end
end
