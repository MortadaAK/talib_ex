defmodule TalibEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :talib_ex,
      version: "0.1.0",
      elixir: "~> 1.13",
      compilers: [:elixir_make | Mix.compilers()],
      make_makefile: "Makefile",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: [
        # These are the default files
        "lib",
        "LICENSE",
        "mix.exs",
        "README.md",
        # You will need to add something like this.
        "c_src/",
        "Makefile"
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.6", runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
