defmodule Cards.MixProject do

  use Mix.Project

  def project do
    [
      app: :cards,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Cards",
      source_url: "https://github.com/mmukunzidd/",
      homepage_url: "http://localhost",
      docs: [main: "Cards", # The main page in the docs
              # logo: "path/to/logo.png",
              extras: ["README.md"]]
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
      {:ex_doc, "~> 0.18.3"}
    ]
  end
end
