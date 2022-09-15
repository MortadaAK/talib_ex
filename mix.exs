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
      description: description(),
      deps: deps(),
      package: package()
    ]
  end

  def application do
    []
  end

  defp package do
    # Docs
    [
      name: "TALibEX",
      source_url: "https://github.com/MortadaAK/talib_ex",
      homepage_url: "https://github.com/MortadaAK/talib_ex",
      links: %{
        "GitHub" => "https://github.com/MortadaAK/talib_ex"
      },
      licenses: ["Apache-2.0"],
      docs: [
        main: "TALibEX",
        extras: ["README.md"]
      ],
      files: ["lib", "LICENSE", "mix.exs", "README.md", "c_src/*.c", "c_src/*.h", "Makefile"]
    ]
  end

  defp description do
    "A NIF wrapper for TA-LIB."
  end

  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end
end
