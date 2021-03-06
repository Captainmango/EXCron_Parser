defmodule CronParser.MixProject do
  use Mix.Project

  def project do
    [
      app: :cron_parser,
      version: "0.1.0",
      elixir: "~> 1.11",
      escript: escript(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp escript do
    [main_module: CronParser.CLI]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:table_rex, "~> 3.1.1"}
    ]
  end
end
