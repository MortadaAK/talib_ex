defmodule TalibEx.MixProject do
  use Mix.Project

  @version "0.6.4"
  @github_url "https://github.com/MortadaAK/talib_ex"

  def project do
    [
      app: :talib_ex_nif,
      version: @version,
      elixir: "~> 1.13",
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_makefile: "Makefile",
      start_permanent: Mix.env() == :prod,
      description: description(),
      deps: deps(),
      package: package(),

      # Precompilation
      make_precompiler: {:nif, CCPrecompiler},
      make_precompiler_url:
        "#{@github_url}/releases/download/v#{@version}/@{artefact_filename}",
      make_precompiler_filename: "talib",
      make_precompiler_priv_paths: ["talib.*"],
      make_precompiler_nif_versions: [versions: ["2.16", "2.17"]],
      cc_precompiler: [
        cleanup: "clean"
      ]
    ]
  end

  def application do
    []
  end

  defp package do
    [
      name: "talib_ex_nif",
      source_url: @github_url,
      homepage_url: @github_url,
      links: %{
        "GitHub" => @github_url
      },
      licenses: ["MIT"],
      files: [
        "lib",
        "LICENSE",
        "mix.exs",
        "README.md",
        "Makefile",
        "checksum-talib_ex_nif.exs"
      ],
      docs: [
        main: "TALibEX",
        extras: ["README.md"]
      ]
    ]
  end

  defp description do
    "A NIF wrapper for TA-LIB."
  end

  defp deps do
    [
      {:elixir_make, "~> 0.8", runtime: false},
      {:cc_precompiler, "~> 0.1", runtime: false},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end
end
