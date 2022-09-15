defmodule TalibEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :talib_ex,
      version: "0.1.0",
      elixir: "~> 1.13",
      compilers: Mix.compilers() ++ [:talib],
      make_makefile: "Makefile",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      # Docs
      name: "TALibEX",
      source_url: "https://github.com/MortadaAK/talib_ex",
      homepage_url: "https://github.com/MortadaAK/talib_ex",
      docs: [
        # The main page in the docs
        main: "TALibEX",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [files: ["lib", "LICENSE", "mix.exs", "README.md", "c_src/", "Makefile"]]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.28"}
    ]
  end
end
