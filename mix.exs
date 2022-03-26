defmodule Cockroach.MixProject do
  use Mix.Project

  def project do
    [
      app: :cockroach,
      version: "0.1.0",
      elixir: "~> 1.12.3",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Cockroach.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:postgrex, "~> 0.13", hex: :postgrex_cdb, override: true}
    ]
  end
end
