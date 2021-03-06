defmodule Zipcloudx.Mixfile do
  use Mix.Project

  @description """
    Elixir zipcloud API wrapper
  """

  def project do
    [app: :zipcloudx,
     version: "0.0.2",
     elixir: "~> 1.1",
     name: "zipcloudx",
     description: @description,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :poison, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poison, "~> 1.5"},
      {:httpoison, "~> 0.8.0"},
      {:ex_doc, "~> 0.8.0", only: :docs},
    ]
  end
end
