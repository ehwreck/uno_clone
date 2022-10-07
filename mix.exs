defmodule UnoClone.MixProject do
  use Mix.Project

  def project do
    [
      app: :uno_clone,
      version: "0.1.0",
      elixir: "~> 1.14",
      description: "A command line application for handling uno cards.",
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/ehwreck/uno_clone"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.12"},
    ]
  end

  defp package do
    [
      licenses: ["GPL-3.0-only"],
      links: %{"GitHub" => "https://github.com/ehwreck/uno_clone"}
    ]
  end

end
