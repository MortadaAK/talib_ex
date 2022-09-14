defmodule Mix.Tasks.Compile.Talib do
  @behaviour Mix.Task.Compiler
  def run(_) do
    if match?({:win32, _}, :os.type()) do
      IO.warn("Windows is not supported.")
      exit(1)
    else
      Mix.Tasks.Talib.run()
      File.mkdir_p("priv")
      {result, _error_code} = System.cmd("make", [], stderr_to_stdout: true)
      IO.binwrite(result)
    end

    :ok
  end

  def clean do
    unless match?({:win32, _}, :os.type()) do
      {_result, _error_code} = System.cmd("make", ["clean"], stderr_to_stdout: true)
    end

    :ok
  end
end
