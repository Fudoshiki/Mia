defmodule Mia.MixProject do
  use Mix.Project

  def project do
    [
      app: :mia,
      version: "0.1.0",
      elixir: "~> 1.16",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Mia.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:bandit, ">= 0.0.0"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:dns_cluster, "~> 0.1.2"},
      {:finch, "~> 0.17"},
      {:floki, ">= 0.35.2", only: :test},
      {:gettext, "~> 0.24"},
      {:git_hooks, "~> 0.8.0-pre0", only: [:dev], runtime: false},
      {:jason, "~> 1.5.0-alpha.2"},
      {:jason_native, "~> 0.1.0"},
      {:mix_audit, "~> 2.1", only: [:dev, :test], runtime: false},
      {:phoenix, github: "phoenixframework/phoenix", override: true},
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, github: "phoenixframework/phoenix_live_view", override: true},
      {:sobelow, "~> 0.13", only: [:dev, :test], runtime: false},
      {:styler, github: "adobe/elixir-styler", only: [:dev, :test], runtime: false},
      {:swoosh, "~> 1.14"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      lint: [
        "deps.get",
        "hex.audit",
        "hex.outdated",
        "deps.audit",
        "deps.unlock --check-unused",
        "compile --warnings-as-errors",
        "format --check-formatted --dry-run",
        "credo -A",
        "dialyzer",
        "sobelow --strict"
      ],
      setup: ["cmd rm -rf _build deps", "deps.get"],
      test: "test",
      upgrade: ["cmd rm -rf mix.lock", "setup"]
    ]
  end
end
