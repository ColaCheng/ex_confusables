defmodule ExConfusables.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_confusables,
      name: "ExConfusables",
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      xref: [exclude: [:inets, :httpc]],
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
      {:benchee, git: "https://github.com/bencheeorg/benchee.git", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Cola Cheng"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ColaCheng/ex_confusables"}
    ]
  end
end
