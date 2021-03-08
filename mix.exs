defmodule ExConfusables.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :ex_confusables,
      name: "ExConfusables",
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs(),
      xref: [exclude: [:inets, :httpc]],
      source_url: "https://github.com/ColaCheng/ex_confusables",
      description: """
      Elixir implementation of Unicode TR39 skeleton algorithm.
      Ref: https://unicode.org/reports/tr39/
      """
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :kernel, :stdlib]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:benchee, git: "https://github.com/bencheeorg/benchee.git", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Cola Cheng"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ColaCheng/ex_confusables"}
    ]
  end

  defp docs do
    [
      main: "ExConfusables",
      source_ref: "v#{@version}",
      formatters: ["html", "epub"],
      extras: ["README.md"]
    ]
  end
end
